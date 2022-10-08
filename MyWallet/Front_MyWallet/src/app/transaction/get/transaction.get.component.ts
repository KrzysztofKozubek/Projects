import {AfterViewInit, Component, ViewChild} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {MatTableDataSource} from "@angular/material/table";
import {MatSort, Sort} from "@angular/material/sort";
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {MatPaginator} from "@angular/material/paginator";
import {clone} from "@okta/okta-auth-js";
import {TransactionCategory} from "../../_model/transaction_category";
import {Transaction} from "../../_model/transaction";
import {Bank} from "../../_model/bank";
import {Wallet} from "../../_model/wallet";
import {WalletService} from "../../wallet/wallet.service";
import {BankService} from "../../bank/bank.service";
import {TransactionService} from "../transaction.service";
import {TransactionCategoryService} from "../../transaction_category/transaction.category.service";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {TransactionCategoryEditComponent} from "../../transaction_category/edit/transaction.category.edit.component";
import {MatDialog} from "@angular/material/dialog";
import {TransactionEditComponent} from "../edit/transaction.component.edit";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-transaction-get',
  templateUrl: './transaction.get.component.html',
  styleUrls: ['./transaction.get.component.css']
})
export class TransactionGetComponent implements AfterViewInit {

  table: any[] = [];

  _wallets: Wallet[] = [];
  _banks: Bank[] = [];
  _transactionCategories: TransactionCategory[] = [];
  _transactions: Transaction[] = [];

  dataSource = new MatTableDataSource(this.table);
  displayedColumns: string[] = ['wallet', 'bank', 'name', 'amount', 'category', 'timestamp', 'operation'];

  constructor(
    public dialog: MatDialog,
    private _liveAnnouncer: LiveAnnouncer,
    private walletService: WalletService,
    private bankService: BankService,
    private transactionService: TransactionService,
    private transactionCategoryService: TransactionCategoryService,
    private route: ActivatedRoute,
  ) {
    this.getTransactionCategory();
    this.getWallets();
    this.getBanks();
    this.getTransactions();

    this.filters?.controls?.name?.valueChanges?.subscribe(value => {
      this._filterName = value;
      this.ngAfterViewInit();
    });

    this.filters?.controls?.minAmount?.valueChanges?.subscribe(value => {
      this._filterMinAmount = value;
      this.ngAfterViewInit();
    });

    this.filters?.controls?.maxAmount?.valueChanges?.subscribe(value => {
      this._filterMaxAmount = value;
      this.ngAfterViewInit();
    });

    this.filters?.controls?.categoryId?.valueChanges?.subscribe(value => {
      this._filterCategoryId = value;
      this.ngAfterViewInit();
    });

    this.filters?.controls?.bankId?.valueChanges?.subscribe(value => {
      this._filterBankId = value;
      this.ngAfterViewInit();
    });

    this.filters?.controls?.minTimestamp?.valueChanges?.subscribe(value => {
      this._filterMinTimestamp = value;
      this.ngAfterViewInit();
    });

    this.filters?.controls?.maxTimestamp?.valueChanges?.subscribe(value => {
      this._filterMaxTimestamp = value;
      this.ngAfterViewInit();
    });
  }

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  ngAfterViewInit() {
    this.table = clone(this._transactions.filter(t => {
      return this._filterName == null || this._filterName == "" || t?.name?.toUpperCase()?.indexOf(this._filterName?.toUpperCase()) != -1;
    }).filter(t => {
      return this._filterMinAmount == null || t?.amount >= this._filterMinAmount;
    }).filter(t => {
      return this._filterMaxAmount == null || t?.amount <= this._filterMaxAmount;
    }).filter(t => {
      return this._filterCategoryId == null || t?.categoryId == this._filterCategoryId;
    }).filter(t => {
      return this._filterBankId == null || t?.bankId == this._filterBankId;
    }).filter(t => {
      return this._filterMinTimestamp == null || this._filterMinTimestamp <= new Date(t?.timestamp);
    }).filter(t => {
      return this._filterMaxTimestamp == null || this._filterMaxTimestamp >= new Date(t?.timestamp);
    }));
    if (this._wallets.length > 0 && this._banks.length > 0 && this._transactionCategories.length > 0) {
      this.table = this.table.map(t => {
        const bankId = t.bankId;
        const bank = this._banks.filter(b => bankId == b.id)[0];
        const wallet = this._wallets.filter(w => bank.walletId == w.id)[0];
        const tcName = this._transactionCategories.filter(tc => t.categoryId == tc.id).map(tc => tc.name)[0];
        return {...wallet, ...bank, wallet: wallet.name, bank: bank.name, categoryName: tcName, ...t};
      });
      this.dataSource = new MatTableDataSource(this.table);
      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator;
    }
  }

  openDialogEdit(element: TransactionCategory) {
    this.dialog.open(TransactionEditComponent, {
      data: element
    });
  }

  clearFilter(formControlName: string) {
    this.filters.patchValue({
      [formControlName]: null
    });
  }

  public filters = new FormGroup({
    name: new FormControl(),
    minAmount: new FormControl(),
    maxAmount: new FormControl(),
    categoryId: new FormControl(),
    bankId: new FormControl(),
    minTimestamp: new FormControl(),
    maxTimestamp: new FormControl(),
  });
  _filterName: string | null = null;
  _filterMinAmount: number | null = null;
  _filterMaxAmount: number | null = null;
  _filterCategoryId: number | null = null;
  _filterBankId: number | null = null;
  _filterMinTimestamp: Date | null = null;
  _filterMaxTimestamp: Date | null = null;

  announceSortChange(sortState: Sort) {
    console.log(JSON.stringify(sortState));
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce('Sorting cleared');
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
      , () => this.updateFilter()
    );
  }

  getTransactionCategory() {
    this.transactionCategoryService.subscribeGet(
      (r: TransactionCategory[]) => this._transactionCategories = r
      , () => this.ngAfterViewInit()
    );
  }

  getTransactions() {
    this.transactionService.subscribeGet(
      (r: Transaction[]) => this._transactions = r
      , () => this.ngAfterViewInit()
    );
  }

  removeTransaction(itemId: number) {
    this.transactionService.funRemove(itemId, () => {
      this.getTransactions();
    }, EMPTY_FUN);
  }

  removeAllTransaction() {
    this.table.forEach(t => {
      this.transactionService.funRemove(t?.id, EMPTY_FUN, EMPTY_FUN);
    });
  }

  // query params
  updateFilter(): void {
    this.route.queryParams.subscribe(value => {
      const bankId: number = value?.['bankId'];
      if (bankId && bankId > 0) {
        const bank = this._banks?.filter(i => i.id == bankId)?.[0];
        this.filters.patchValue({
          bankId: bank?.id
        });
        this._filterBankId = value?.['bankId'];
      }
    });
    this.ngAfterViewInit();
  }
}
