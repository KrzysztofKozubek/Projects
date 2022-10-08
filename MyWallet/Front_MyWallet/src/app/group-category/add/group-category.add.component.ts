import {Component, OnInit} from '@angular/core';
import {MatDialogRef} from "@angular/material/dialog";
import {GroupCategory} from "../../_model/group_category";
import {FormControl, FormGroup} from "@angular/forms";
import {GroupCategoryService} from "../group.category.service";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {TransactionCategoryService} from "../../transaction_category/transaction.category.service";
import {TransactionCategory} from "../../_model/transaction_category";

@Component({
  selector: 'app-group-category-add',
  templateUrl: './group-category.add.component.html',
  styleUrls: ['./group-category.add.component.css']
})
export class GroupCategoryAddComponent implements OnInit {

  _groupCategories: GroupCategory = new GroupCategory();
  _transactionCategories: TransactionCategory[] = [];

  addForm = new FormGroup({
    name: new FormControl(''),
    color: new FormControl(''),
    keyword: new FormControl(''),
  });

  constructor(
    private dialogRef: MatDialogRef<GroupCategoryAddComponent>,
    private groupCategoryService: GroupCategoryService,
    private tcService: TransactionCategoryService,
  ) {
    this.getTransactionCategory();
    this.addForm?.controls?.name?.valueChanges?.subscribe(value => {
      if (value) {
        this._groupCategories.name = value;
      }
    });
    this.addForm?.controls?.color?.valueChanges?.subscribe(value => {
      if (value) {
        this._groupCategories.color = value;
      }
    });
    this.addForm?.controls?.keyword?.valueChanges?.subscribe(value => {
      if (value) {
        this._groupCategories.keywords = JSON.stringify(value);
      }
    });
  }

  ngOnInit(): void {
  }

  addItem() {
    this.groupCategoryService.funAdd(this._groupCategories, EMPTY_FUN, EMPTY_FUN);
    this.dialogRef.close();
  }

  getTransactionCategory() {
    this.tcService.subscribeGet(
      (r: TransactionCategory[]) => this._transactionCategories = r
      , () => this.ngOnInit()
    );
  }
}
