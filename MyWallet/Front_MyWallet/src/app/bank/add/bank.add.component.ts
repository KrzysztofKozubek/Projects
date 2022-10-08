import {AfterViewInit, Component, OnInit} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {Wallet} from "../../_model/wallet";
import {Bank} from "../../_model/bank";
import {MatDialog, MatDialogRef} from "@angular/material/dialog";
import {WalletService} from "../../wallet/wallet.service";
import {BankService} from "../bank.service";
import {EMPTY_FUN} from "../../_helper/global.variables";

@Component({
  selector: 'app-bank-add',
  templateUrl: './bank.add.component.html',
  styleUrls: ['./bank.add.component.css']
})
export class BankAddComponent implements AfterViewInit {

  _wallets: Wallet[] = [];

  _bank: Bank = new Bank();

  constructor(
    private dialogRef: MatDialogRef<BankAddComponent>,
    public dialog: MatDialog,
    private walletService: WalletService,
    private bankService: BankService,
  ) {
    this.getWallets();

    this.addForm?.controls?.wallet?.valueChanges?.subscribe(value => {
      this._bank.walletId = value;
    });
    this.addForm?.controls?.bank?.valueChanges?.subscribe(value => {
      this._bank.name = value;
    });
    this.addForm?.controls?.amount?.valueChanges?.subscribe(value => {
      this._bank.amount = value ? value : 0;
    });
  }

  ngAfterViewInit() {
  }

  public addForm = new FormGroup({
    wallet: new FormControl(),
    bank: new FormControl(),
    amount: new FormControl(),
  });

  getWallets() {
    this.walletService.subscribeGet(
      (r: Wallet[]) => this._wallets = r
      , () => this.ngAfterViewInit()
    );
  }

  addBank() {
    this.bankService.funAdd(this._bank, EMPTY_FUN, EMPTY_FUN);
    this.dialogRef.close();
  }
}
