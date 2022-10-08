import {AfterViewInit, Component, ViewChild} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {MatTableDataSource} from "@angular/material/table";
import {MatSort, Sort} from "@angular/material/sort";
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {MatPaginator} from "@angular/material/paginator";
import {clone} from "@okta/okta-auth-js";
import {Wallet} from "../../_model/wallet";
import {Bank} from "../../_model/bank";
import {MatDialog} from "@angular/material/dialog";
import {WalletService} from "../../wallet/wallet.service";
import {BankService} from "../bank.service";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {BankEditComponent} from "../edit/bank.edit.component";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-bank-get',
  templateUrl: './bank.get.component.html',
  styleUrls: ['./bank.get.component.css']
})
export class BankGetComponent implements AfterViewInit {

  table: any[] = [];

  _wallets: Wallet[] = [];
  _banks: Bank[] = [];
  dataSource = new MatTableDataSource(this.table);
  displayedColumns: string[] = ['wallet', 'name', 'amount', 'operation'];

  constructor(
    public dialog: MatDialog,
    private _liveAnnouncer: LiveAnnouncer,
    private walletService: WalletService,
    private bankService: BankService,
    private route: ActivatedRoute,
  ) {
    this.getWallets();
    this.getBanks();

    this.filters?.controls?.wallet?.valueChanges?.subscribe(value => {
      this._filterWallet = value;
      this.ngAfterViewInit();
    });
    this.filters?.controls?.bank?.valueChanges?.subscribe(value => {
      this._filterBank = value;
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
  }

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  ngAfterViewInit() {
    this.table = clone(this._banks.filter(item => {
      return this._filterWallet == null || item?.walletId == this._filterWallet;
    }).filter(item => {
      return this._filterBank == null || item?.id == this._filterBank;
    }).filter(item => {
      return this._filterMinAmount == null || item?.amount >= this._filterMinAmount;
    }).filter(item => {
      return this._filterMaxAmount == null || item?.amount <= this._filterMaxAmount;
    }));
    this.table = this.table.map(b => {
      let wallet = this._wallets.filter(item => {
        return b.walletId == item.id;
      })[0];
      return {...wallet, wallet: wallet?.name, walletId: wallet?.id, bank: b?.name, ...b}
    });
    this.dataSource = new MatTableDataSource(this.table);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }

  openDialogEdit(element: Bank) {
    this.dialog.open(BankEditComponent, {
      data: element
    });
  }

  clearFilter(formControlName: string) {
    this.filters.patchValue({
      [formControlName]: null
    });
  }

  public filters = new FormGroup({
    wallet: new FormControl(),
    bank: new FormControl(),
    minAmount: new FormControl(),
    maxAmount: new FormControl(),
  });
  _filterWallet: number | null = null;
  _filterBank: number | null = null;
  _filterMinAmount: number | null = null;
  _filterMaxAmount: number | null = null;


  removeBank(idBank: number) {
    this.bankService.funRemove(idBank, () => {
      this.getBanks();
    }, EMPTY_FUN);
  }

  getWallets() {
    this.walletService.subscribeGet(
      (r: Wallet[]) => this._wallets = r
      , () => this.updateFilter()
    );
  }

  getBanks() {
    return this.bankService.subscribeGet(
      (r: Bank[]) => this._banks = r
      , () => this.updateFilter()
    );
  }

  announceSortChange(sortState: Sort) {
    console.log(JSON.stringify(sortState));
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce('Sorting cleared');
    }
  }

  // query params
  openWeb(item: Bank, type: string) {
    this.bankService.openWeb(item);
  }

  updateFilter(): void {
    this.route.queryParams.subscribe(value => {
      const walletId: number = value?.['walletId'];
      if (walletId && walletId > 0) {
        const wallet = this._wallets?.filter(i => i.id == walletId)?.[0];
        this.filters.patchValue({
          wallet: wallet?.id
        });
        this._filterWallet = value?.['walletId'];
      }

      const bankId: number = value?.['bankId'];
      if (bankId && bankId > 0) {
        const bank = this._banks?.filter(i => i.id == bankId)?.[0];
        this.filters.patchValue({
          bank: bank?.id
        });
        this._filterBank = value?.['bankId'];
      }
    });
    this.ngAfterViewInit();
  }
}
