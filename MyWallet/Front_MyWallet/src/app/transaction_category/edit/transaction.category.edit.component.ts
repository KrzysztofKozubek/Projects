import {Component, Inject, OnInit} from '@angular/core';
import {TransactionCategoryService} from "../transaction.category.service";
import {TransactionCategory} from "../../_model/transaction_category";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {FormControl, FormGroup} from "@angular/forms";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {COMMA, ENTER} from "@angular/cdk/keycodes";
import {MatChipInputEvent} from "@angular/material/chips";

@Component({
  selector: 'app-transaction-category-edit',
  templateUrl: './transaction.category.edit.component.html',
  styleUrls: ['./transaction.category.edit.component.css']
})
export class TransactionCategoryEditComponent implements OnInit {

  _transactionCategory: TransactionCategory;
  _keywords: string[] = [];

  editTransactionCategoryForm = new FormGroup({
    name: new FormControl(),
    keyword: new FormControl(),
  });

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: TransactionCategory,
    private dialogRef: MatDialogRef<TransactionCategoryEditComponent>,
    private transactionCategoryService: TransactionCategoryService,
  ) {
    this._transactionCategory = data;
    this.editTransactionCategoryForm.patchValue({
      name: data?.name
    });
    this._keywords = JSON.parse(data?.keywords);
    this._keywords = this._keywords.sort((a, b) => a.localeCompare(b));
    this.editTransactionCategoryForm?.controls?.name?.valueChanges?.subscribe(value => {
      if (value) {
        this._transactionCategory.name = value
      }
    });
  }

  ngOnInit(): void {
  }

  editTransactionCategory() {
    this.transactionCategoryService.funEdit(this._transactionCategory, EMPTY_FUN, EMPTY_FUN);
    this.dialogRef.close();
  }

  // View
  readonly separatorKeysCodes = [ENTER, COMMA] as const;

  addKeyWord(event: MatChipInputEvent): void {
    const value = (event.value || '').trim();
    if (value) {
      this._keywords.push(value);
      this._keywords = this._keywords.sort((a, b) => a.localeCompare(b));
      this.editTransactionCategoryForm.patchValue({
        keyword: this._keywords
      });
    }
    this._transactionCategory.keywords = JSON.stringify(this._keywords);
    event.chipInput!.clear();
  }

  removeKeyWord(item: string): void {
    const index = this._keywords.indexOf(item);
    if (index >= 0) {
      this._keywords.splice(index, 1);
    }
    this._transactionCategory.keywords = JSON.stringify(this._keywords);
  }
}
