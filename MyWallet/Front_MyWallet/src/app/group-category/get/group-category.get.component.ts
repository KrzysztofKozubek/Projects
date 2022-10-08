import {AfterViewInit, Component, ViewChild} from '@angular/core';
import {MatDialog} from "@angular/material/dialog";
import {MatTableDataSource} from "@angular/material/table";
import {TransactionCategory} from "../../_model/transaction_category";
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {TransactionCategoryService} from "../../transaction_category/transaction.category.service";
import {GroupCategoryService} from "../group.category.service";
import {MatSort, Sort} from "@angular/material/sort";
import {MatPaginator} from "@angular/material/paginator";
import {clone} from "@okta/okta-auth-js";
import {GroupCategory} from "../../_model/group_category";
import {TransactionCategoryEditComponent} from "../../transaction_category/edit/transaction.category.edit.component";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {GroupCategoryEditComponent} from "../edit/group-category.edit.component";

@Component({
  selector: 'app-group-category-get',
  templateUrl: './group-category.get.component.html',
  styleUrls: ['./group-category.get.component.css']
})
export class GroupCategoryGetComponent implements AfterViewInit {

  table: any[] = [];
  dataSource = new MatTableDataSource(this.table);
  displayedColumns: string[] = ['name', 'color', 'keywords', 'operation'];

  _groupCategories: GroupCategory[] = [];
  _transactionCategories: TransactionCategory[] = [];

  constructor(
    public dialog: MatDialog,
    private _liveAnnouncer: LiveAnnouncer,
    private _transactionCategoryService: TransactionCategoryService,
    private _groupCategoryService: GroupCategoryService,
  ) {
    this.getTransactionCategories();
    this.getGroupCategories();
  }

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  ngAfterViewInit(): void {
    this.table = clone(this._groupCategories?.map(gc => {
      return {...gc, nameCategories: this.convertIndexTransactionCategoryToNameTransactionCategory(JSON.parse(gc.keywords))}
    }));
    this.dataSource = new MatTableDataSource(this.table);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }

  openDialogEdit(element: TransactionCategory) {
    let dialogRef = this.dialog.open(GroupCategoryEditComponent, {
      data: element
    });
    dialogRef.afterClosed().subscribe(value => {
      console.log('openDialogEdit')
    });
  }

  removeElement(elementId: number) {
    this._groupCategoryService.funRemove(elementId, () => {
      this.getGroupCategories();
    }, EMPTY_FUN);
  }

  getGroupCategories() {
    this._groupCategoryService.subscribeGet(
      (r: GroupCategory[]) => this._groupCategories = r
      , () => this.ngAfterViewInit()
    );
  }

  getTransactionCategories() {
    this._transactionCategoryService.subscribeGet(
      (r: TransactionCategory[]) => this._transactionCategories = r
      , () => this.ngAfterViewInit()
    );
  }

  convertIndexTransactionCategoryToNameTransactionCategory(transactionCategoriesId: number[]) {
    return transactionCategoriesId?.map(id => this._transactionCategories?.filter(tc => tc?.id == id)?.map(tc => tc?.name)?.[0]);
  }

  announceSortChange(sortState: Sort) {
    console.log(JSON.stringify(sortState));
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce('Sorting cleared');
    }
  }

}
