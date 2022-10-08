import {AfterViewInit, Component} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {Wallet} from "../../_model/wallet";
import {WalletService} from "../wallet.service";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {MatDialog, MatDialogRef} from "@angular/material/dialog";

@Component({
  selector: 'app-wallet-add',
  templateUrl: './wallet.add.component.html',
  styleUrls: ['./wallet.add.component.css']
})
export class WalletAddComponent implements AfterViewInit {

  _wallet: Wallet = new Wallet();

  constructor(
    private dialogRef: MatDialogRef<WalletAddComponent>,
    public dialog: MatDialog,
    private walletService: WalletService,
  ) {
    this.addForm?.controls?.wallet?.valueChanges?.subscribe(value => {
      if (value) this._wallet.name = value;
    });
    this.addForm?.controls?.amount?.valueChanges?.subscribe(value => {
      this._wallet.amount = value ? value : 0;
    });
  }

  ngAfterViewInit() {
  }

  addForm = new FormGroup({
    wallet: new FormControl(''),
    amount: new FormControl(0),
  });

  addWallet() {
    this.walletService.funAdd(this._wallet, EMPTY_FUN, EMPTY_FUN);
    this.dialogRef.close();
  }
}
