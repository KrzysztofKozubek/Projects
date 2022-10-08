import {Component, Inject, OnInit} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {Wallet} from "../../_model/wallet";
import {Bank} from "../../_model/bank";
import {TransactionCategory} from "../../_model/transaction_category";
import {Transaction} from "../../_model/transaction";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {TransactionService} from "../transaction.service";
import {WalletService} from "../../wallet/wallet.service";
import {BankService} from "../../bank/bank.service";
import {TransactionCategoryService} from "../../transaction_category/transaction.category.service";

@Component({
  selector: 'app-transaction-add',
  templateUrl: './transaction.component.add.html',
  styleUrls: ['./transaction.component.add.css']
})
export class TransactionAddComponent implements OnInit {

  _wallets: Wallet[] = [];
  _banks: Bank[] = [];
  _transactions: Transaction[] = [];
  _transactionCategories: TransactionCategory[] = [];

  _transaction: Transaction = new Transaction();

  editForm = new FormGroup({
    name: new FormControl(''),
    amount: new FormControl(0),
    categoryId: new FormControl(0),
    bankId: new FormControl(0),
    timestamp: new FormControl(''),
  });

  constructor(
    private walletService: WalletService,
    private bankService: BankService,
    private transactionCategoryService: TransactionCategoryService,
    private dialogRef: MatDialogRef<TransactionAddComponent>,
    private transactionService: TransactionService,
  ) {
    this.getWallets();
    this.getBanks();
    this.getTransactions();
    this.getTransactionCategory();

    this.editForm?.controls?.name?.valueChanges?.subscribe(value => {
      if (value) this._transaction.name = value;
    });
    this.editForm?.controls?.amount?.valueChanges?.subscribe(value => {
      this._transaction.amount = value ? value : 0;
    });
    this.editForm?.controls?.categoryId?.valueChanges?.subscribe(value => {
      if (value) this._transaction.categoryId = value;
    });
    this.editForm?.controls?.bankId?.valueChanges?.subscribe(value => {
      if (value) {
        this._transaction.bankId = value;
        this._transaction.walletId = this._banks.filter(b => b.id == value).map(b => b.walletId)[0];
      }
    });
    this.editForm?.controls?.timestamp?.valueChanges?.subscribe(value => {
      if (value) this._transaction.timestamp = value;
    });
  }

  addTransaction() {
    this.transactionService.funAdd(this._transaction, EMPTY_FUN, EMPTY_FUN);
    this.dialogRef.close();
  }

  ngOnInit(): void {
  }

  getWallets() {
    this.walletService.subscribeGet((r: Wallet[]) => this._wallets = r, EMPTY_FUN);
  }

  getBanks() {
    return this.bankService.subscribeGet(
      (r: Bank[]) => this._banks = r, EMPTY_FUN);
  }

  getTransactionCategory() {
    this.transactionCategoryService.subscribeGet(
      (r: TransactionCategory[]) => this._transactionCategories = r, EMPTY_FUN);
  }

  getTransactions() {
    this.transactionService.subscribeGet(
      (r: Transaction[]) => this._transactions = r, EMPTY_FUN);
  }
}
