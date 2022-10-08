import {AfterViewInit, Component, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup} from '@angular/forms';
import {BankService} from "../bank/bank.service";
import {MatTableDataSource} from "@angular/material/table";
import {MatSort, Sort} from "@angular/material/sort";
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {MatPaginator} from "@angular/material/paginator";
import {Bank} from "../_model/bank";
import {WalletService} from "../wallet/wallet.service";
import {Wallet} from "../_model/wallet";
import {TransactionCategory} from "../_model/transaction_category";
import {Transaction} from "../_model/transaction";
import {ImportService} from "./import.service";
import {TransactionCategoryService} from "../transaction_category/transaction.category.service";
import {clone} from "@okta/okta-auth-js";
import {ThemePalette} from "@angular/material/core";
import {Csv2json} from "../_helper/csv2json";
import {TransactionService} from "../transaction/transaction.service";
import {EMPTY_FUN} from "../_helper/global.variables";

@Component({
  selector: 'app-import',
  templateUrl: './import.component.html',
  styleUrls: ['./import.component.css']
})
export class ImportComponent implements AfterViewInit {

  // View
  table: any[] = [];
  listBanks: Bank[] = [];
  listTransactionCategories: TransactionCategory[] = [];

  _wallets: Wallet[] = [];
  _banks: Bank[] = [];
  _transactionCategories: TransactionCategory[] = [];
  _transactions: Transaction[] = [];

  // Upload file
  _files: any = [];
  _fileColumns: string[] = [];
  _fileRows: object[] = [];
  _delimiter: string = ';';
  color: ThemePalette = 'primary';
  accept: string = `.csv,.MP4`;

  // Table
  dataSource = new MatTableDataSource(this.table);
  displayedColumns: string[] = ['wallet', 'bank', 'name', 'amount', 'category', 'timestamp'];

  // Forms
  importCSV1Step: FormGroup;
  fileControl: FormControl;
  configMapper2Step: FormGroup;
  configCategory3Step: FormGroup;

  constructor(
    private _liveAnnouncer: LiveAnnouncer,
    private walletService: WalletService,
    private transactionService: TransactionService,
    private bankService: BankService,
    private importService: ImportService,
    private transactionCategoryService: TransactionCategoryService,
    private formBuilder: FormBuilder,
    private csv2json: Csv2json,
  ) {
    this.getTransactionCategory();
    this.getWallets();
    this.getBanks();

    // Step 1
    this.fileControl = new FormControl(this._files);
    this.importCSV1Step = this.formBuilder.group({
      fileControl: this.fileControl,
      delimiter: new FormControl(),
    });
    this.importCSV1Step.patchValue({
      delimiter: this?._delimiter,
    });
    this.importCSV1Step?.controls?.['delimiter']?.valueChanges.subscribe(value => {
      this._delimiter = value;
    })
    // Step 2
    this.configMapper2Step = this.formBuilder.group({
      bankId: new FormControl(''),
      mapTransactionName: new FormControl(''),
      mapAmount: new FormControl(''),
      mapCategory: new FormControl(''),
      mapTime: new FormControl(''),
    });
    // Step 3
    this.configCategory3Step = this.formBuilder.group({
      configCategory: new FormControl(''),
      dtc: new FormControl(''),
    });
  }

  ngOnInit() {
    this.fileControl.valueChanges.subscribe((files: any) => {
      if (!Array.isArray(files)) {
        this._files = [files];
      } else {
        this._files = files;
      }
    });
  }

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  ngAfterViewInit() {
    this.table = clone(this._transactions);
    this.configCategory3Step.patchValue({
      configCategory: JSON.stringify(this._transactionCategories, undefined, 4)
    });

    if (this._wallets?.length > 0 && this._banks?.length > 0 && this._transactionCategories?.length > 0) {
      this.table = this.table?.map(t => {
        const bankId = t?.bankId;
        const bank = this._banks?.filter(b => bankId == b?.id)[0];
        const wallet = this._wallets?.filter(w => bank?.walletId == w?.id)[0];
        const tcName = this._transactionCategories?.filter(tc => t?.categoryId == tc?.id).map(tc => tc?.name)[0];
        return {...wallet, ...bank, wallet: wallet?.name, bank: bank?.name, categoryName: tcName, ...t};
      });
      this.dataSource = new MatTableDataSource(this.table);
      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator;
    }
  }

  getWallets() {
    this.walletService.subscribeGet(
      (r: Wallet[]) => this._wallets = r
      , () => this.ngAfterViewInit()
    );
  }

  getBanks() {
    return this.bankService.subscribeGet(
      (r: Bank[]) => this._banks = r
      , () => this.ngAfterViewInit()
    );
  }

  getTransactionCategory() {
    this.transactionCategoryService.subscribeGet(
      (r: TransactionCategory[]) => this._transactionCategories = r.map(a => TransactionCategory.clone(a))
      , () => this.ngAfterViewInit()
    );
  }

  prepareTransaction() {
    const bank: Bank = this.configMapper2Step?.controls?.['bankId']?.value;
    const transactionName: string = this.configMapper2Step?.controls?.['mapTransactionName']?.value;
    const amount: string = this.configMapper2Step?.controls?.['mapAmount']?.value;
    const time: string = this.configMapper2Step?.controls?.['mapTime']?.value;
    const categoryConfigJSON: string = this.configCategory3Step?.controls?.['configCategory']?.value;

    const categoryConfig = JSON.parse(categoryConfigJSON);
    this._transactionCategories = categoryConfig;

    const walletId = this._wallets?.filter(w => bank?.walletId == w?.id)[0]?.id;
    this._transactions = this._fileRows?.map(row => {
      return Transaction.of(
        // @ts-ignore
        row[transactionName]?.trim().replace(/ +(?= )/g,''),
        // @ts-ignore
        this.findCategoryId(row[transactionName], categoryConfig),
        walletId ? walletId : 0,
        bank?.id,
        // @ts-ignore
        row[amount]?.toString()?.replace(",", ".").replace(/\s/g, ""),
        // @ts-ignore
        this.formatDate(row[time])
      );
    });
    this.ngAfterViewInit();
  }

  formatDate(pseudoDate: string) {
    let split: string[] = pseudoDate?.split("-");
    if (split?.length == 3) {
      if (split[0]?.length == 4) {
        return `${split[0]}-${split[1]}-${split[2]}`;
      } else {
        return `${split[2]}-${split[1]}-${split[0]}`;
      }
    }
    return "0000-00-00";
  }

  findCategoryId(transactionName: string, transactionCategories: TransactionCategory[] = this._transactionCategories): number {
    const tc: TransactionCategory[] = this.findCategory(transactionName, transactionCategories);
    return tc?.length > 0
      ? tc[0]?.id
      : this.getDefaultCategory()?.id;
  }

  findCategory(transactionName: string, transactionCategories: TransactionCategory[] = this._transactionCategories): TransactionCategory[] {
    return transactionCategories?.filter(c => {
      const keywordsJSON: string = c.keywords;
      const keywords: string[] = JSON.parse(keywordsJSON);
      return keywords?.filter(keyword => transactionName?.toUpperCase()?.indexOf(keyword?.toUpperCase()) != -1)?.length > 0;
    });
  }

  getDefaultCategory(): TransactionCategory {
    return this._transactionCategories.filter(t => t?.default)[0];
  }

  uploadFile() {
    if (this._files?.length > 0) {
      let fileReader = new FileReader();
      fileReader.onload = (e) => {
        let csvFileContent = fileReader?.result?.toString();
        // @ts-ignore
        this._fileRows = this.csv2json.CSV2JSON(csvFileContent, this._delimiter);
        this._fileColumns = Object.keys(this._fileRows[0]);
      }
      fileReader.readAsText(this._files[0]);
    }
  }

  changeDefaultTransactionCategory() {
    let dtc:TransactionCategory = this.configCategory3Step?.controls?.['dtc']?.value;
    this._transactionCategories = this._transactionCategories.map(tc => {
      tc.default = tc?.id == dtc?.id;
      return tc;
    });
    this.ngAfterViewInit();
    this.prepareTransaction();
  }

  onFileSelected(a : any) {
    this._files = a.target.files;
  }

  importTransactionList(index: number = 0) {
    if (index < this._transactions?.length) {
      const i = index + 1;
      this.transactionService.funAdd(
        this._transactions[index],
        () => this.importTransactionList(i),
        () => this.importTransactionList(i));
    }
  }

  delay(ms: number) {
    return new Promise( resolve => setTimeout(resolve, ms) );
  }

  announceSortChange(sortState: Sort) {
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce('Sorting cleared');
    }
  }
}
