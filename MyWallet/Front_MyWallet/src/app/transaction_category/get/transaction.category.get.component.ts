import {AfterViewInit, Component, ViewChild} from '@angular/core';
import {MatTableDataSource} from "@angular/material/table";
import {MatSort, Sort} from "@angular/material/sort";
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {MatPaginator} from "@angular/material/paginator";
import {clone} from "@okta/okta-auth-js";
import {MatDialog} from "@angular/material/dialog";
import {TransactionCategory} from "../../_model/transaction_category";
import {TransactionCategoryService} from "../transaction.category.service";
import {TransactionCategoryEditComponent} from "../edit/transaction.category.edit.component";
import {EMPTY_FUN} from "../../_helper/global.variables";
import {FormControl, FormGroup} from "@angular/forms";

@Component({
  selector: 'app-transaction-category-get',
  templateUrl: './transaction.category.get.component.html',
  styleUrls: ['./transaction.category.get.component.css']
})
export class TransactionCategoryGetComponent implements AfterViewInit {

  table: any[] = [];
  dataSource = new MatTableDataSource(this.table);
  displayedColumns: string[] = ['name', 'keywords', 'operation'];

  _transactionCategories: TransactionCategory[] = [];

  constructor(
    public dialog: MatDialog,
    private _liveAnnouncer: LiveAnnouncer,
    private _transactionCategoryService: TransactionCategoryService,
  ) {
    this.filters?.controls?.name?.valueChanges?.subscribe(value => {
      this._filterName = value;
      this.ngAfterViewInit();
    });
    this.filters?.controls?.keywords?.valueChanges?.subscribe(value => {
      this._filterKeyword = value;
      this.ngAfterViewInit();
    });
    this.getTransactionCategories();
  }

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  ngAfterViewInit() {
    this.table = clone(this._transactionCategories.filter(tc => {
      return this._filterName == null || this._filterName == "" || tc?.name?.toUpperCase()?.indexOf(this._filterName?.toUpperCase()) != -1;
    }).filter(tc => {
      return this._filterKeyword == null || this._filterKeyword == "" || tc?.keywords?.toUpperCase()?.indexOf(this._filterKeyword?.toUpperCase()) != -1;
    }));
    this.dataSource = new MatTableDataSource(this.table);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }

  getTransactionCategories() {
    this._transactionCategoryService.subscribeGet(
      (r: TransactionCategory[]) => this._transactionCategories = r
      , () => this.ngAfterViewInit()
    );
  }

  openDialogEdit(element: TransactionCategory) {
    let dialogRef = this.dialog.open(TransactionCategoryEditComponent, {
      data: element
    });
    dialogRef.afterClosed().subscribe(value => {
      console.log('openDialogEdit')
    });
  }

  removeTransactionCategory(itemId: number) {
    this._transactionCategoryService.funRemove(itemId, () => {
      this.getTransactionCategories();
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

  // filters
  filters = new FormGroup({
    name: new FormControl(),
    keywords: new FormControl(),
  });
  _filterName: string | null;
  _filterKeyword: string | null;
}
