import {AfterViewInit, Component, Inject} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {Wallet} from "../../_model/wallet";
import {WalletService} from "../wallet.service";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";

@Component({
  selector: 'app-wallet-edit',
  templateUrl: './wallet.edit.component.html',
  styleUrls: ['./wallet.edit.component.css']
})
export class WalletEditComponent implements AfterViewInit {

  _wallet: Wallet = new Wallet();

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: Wallet,
    private walletService: WalletService,
    private dialogRef: MatDialogRef<WalletEditComponent>,
  ) {
    this._wallet = data;
    this.editForm.patchValue({
      ...data, wallet: data?.name
    });
    this.editForm?.controls?.wallet?.valueChanges?.subscribe(value => {
      if (value) this._wallet.name = value;
    });
    this.editForm?.controls?.amount?.valueChanges?.subscribe(value => {
      this._wallet.amount = value ? value : 0;
    });
  }

  ngAfterViewInit() {
  }

  editForm = new FormGroup({
    wallet: new FormControl(''),
    amount: new FormControl(0),
  });

  editWallet() {
    this.walletService.funEdit(this._wallet, EMPTY_FUN, EMPTY_FUN);
    this.dialogRef.close();
  }
}
