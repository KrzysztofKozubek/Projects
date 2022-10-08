import {AfterViewInit, Component, OnInit, ViewChild} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {MatTableDataSource} from "@angular/material/table";
import {MatSort, Sort} from "@angular/material/sort";
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {MatPaginator} from "@angular/material/paginator";
import {clone} from "@okta/okta-auth-js";
import {Wallet} from "../../_model/wallet";
import {WalletService} from "../wallet.service";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {MatDialog} from "@angular/material/dialog";
import {Bank} from "../../_model/bank";
import {WalletEditComponent} from "../edit/wallet.edit.component";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-wallet-get',
  templateUrl: './wallet.get.component.html',
  styleUrls: ['./wallet.get.component.css']
})
export class WalletGetComponent implements AfterViewInit {

  table: any[] = [];

  _wallets: Wallet[] = [];
  dataSource = new MatTableDataSource(this.table);
  displayedColumns: string[] = ['wallet', 'amount', 'operation'];

  constructor(
    public dialog: MatDialog,
    private _liveAnnouncer: LiveAnnouncer,
    private walletService: WalletService,
    private route: ActivatedRoute,
  ) {
    this.getWallets();

    this.filters?.controls?.wallet?.valueChanges?.subscribe(value => {
      this._filterWallet = value;
      this.ngAfterViewInit();
    });
  }

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  ngAfterViewInit() {
    this.table = clone(this._wallets.filter(item => {
      return this._filterWallet == null || item?.id == this._filterWallet;
    }).filter(item => {
      return this._filterMinAmount == null || item?.amount >= this._filterMinAmount;
    }).filter(item => {
      return this._filterMaxAmount == null || item?.amount <= this._filterMaxAmount;
    }));
    this.dataSource = new MatTableDataSource(this.table);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }

  getWallets() {
    this.walletService.subscribeGet(
      (r: Wallet[]) => this._wallets = r
      , () => this.updateFilter()
    );
  }

  openDialogEdit(element: Bank) {
    this.dialog.open(WalletEditComponent, {
      data: element
    });
  }

  clearFilter(formControlName: string) {
    this.filters.patchValue({
      [formControlName]: null
    });
  }

  filters = new FormGroup({
    wallet: new FormControl(),
    minAmount: new FormControl(),
    maxAmount: new FormControl(),
  });
  _filterWallet: number | null = null;
  _filterMinAmount: number | null = null;
  _filterMaxAmount: number | null = null;

  removeWallet(idWallet: number) {
    this.walletService.funRemove(idWallet, () => {
      this.getWallets();
    }, EMPTY_FUN);
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
  openWeb(item: Wallet, type: string) {
    this.walletService.openWeb(item);
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
    });
    this.ngAfterViewInit();
  }
}
