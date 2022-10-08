import {AfterViewInit, Component, Inject} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {Wallet} from "../../_model/wallet";
import {Bank} from "../../_model/bank";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {WalletService} from "../../wallet/wallet.service";
import {BankService} from "../bank.service";
import {EMPTY_FUN} from "../../_helper/global.variables";

@Component({
  selector: 'app-bank-edit',
  templateUrl: './bank.edit.component.html',
  styleUrls: ['./bank.edit.component.css']
})
export class BankEditComponent implements AfterViewInit {

  _bank: Bank = new Bank();

  _wallets: Wallet[] = [];

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: Bank,
    private walletService: WalletService,
    private bankService: BankService,
    private dialogRef: MatDialogRef<BankEditComponent>,
  ) {
    this.getWallets();

    this._bank = data;
    this.editForm.patchValue({
      ...data, wallet: data.walletId
    });
    this.editForm?.controls?.wallet?.valueChanges?.subscribe(value => {
      if (value) this._bank.walletId = value;
    });
    this.editForm?.controls?.bank?.valueChanges?.subscribe(value => {
      if (value) this._bank.name = value;
    });
    this.editForm?.controls?.amount?.valueChanges?.subscribe(value => {
      this._bank.amount = value ? value : 0;
    });
  }

  ngAfterViewInit() {
  }

  public editForm = new FormGroup({
    wallet: new FormControl(0),
    bank: new FormControl(''),
    amount: new FormControl(0),
  });

  getWallets() {
    this.walletService.subscribeGet(
      (r: Wallet[]) => this._wallets = r
      , () => this.ngAfterViewInit()
    );
  }

  editBank() {
    this.bankService.funEdit(this._bank, EMPTY_FUN, EMPTY_FUN);
    this.dialogRef.close();
  }
}
