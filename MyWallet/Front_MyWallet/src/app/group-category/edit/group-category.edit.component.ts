import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {GroupCategory} from "../../_model/group_category";
import {FormControl, FormGroup} from "@angular/forms";
import {GroupCategoryService} from "../group.category.service";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {TransactionCategoryService} from "../../transaction_category/transaction.category.service";
import {TransactionCategory} from "../../_model/transaction_category";

@Component({
  selector: 'app-group-category-edit',
  templateUrl: './group-category.edit.component.html',
  styleUrls: ['./group-category.edit.component.css']
})
export class GroupCategoryEditComponent implements OnInit {

  _groupCategories: GroupCategory = new GroupCategory();
  _transactionCategories: TransactionCategory[] = [];

  editForm = new FormGroup({
    name: new FormControl(''),
    color: new FormControl(''),
    keyword: new FormControl(''),
  });

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: GroupCategory,
    private dialogRef: MatDialogRef<GroupCategoryEditComponent>,
    private groupCategoryService: GroupCategoryService,
    private tcService: TransactionCategoryService,
  ) {
    this.getTransactionCategory();
    this._groupCategories = data;
    this.editForm.patchValue({
      ...data, name: data?.name, keyword: JSON.parse(data?.keywords)
    });
    this.editForm?.controls?.name?.valueChanges?.subscribe(value => {
      if (value) {
        this._groupCategories.name = value;
      }
    });
    this.editForm?.controls?.color?.valueChanges?.subscribe(value => {
      if (value) {
        this._groupCategories.color = value;
      }
    });
    this.editForm?.controls?.keyword?.valueChanges?.subscribe(value => {
      if (value) {
        this._groupCategories.keywords = JSON.stringify(value);
      }
    });
  }

  ngOnInit(): void {
  }

  editItem() {
    this.groupCategoryService.funEdit(this._groupCategories, EMPTY_FUN, EMPTY_FUN);
    this.dialogRef.close();
  }

  getTransactionCategory() {
    this.tcService.subscribeGet(
      (r: TransactionCategory[]) => this._transactionCategories = r
      , () => this.ngOnInit()
    );
  }
}
