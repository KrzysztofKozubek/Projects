import {AfterViewInit, Component} from '@angular/core';
import {MatDialog} from "@angular/material/dialog";
import {TransactionCategoryAddComponent} from "./add/transaction.category.add.component";

@Component({
  selector: 'app-transaction-category',
  templateUrl: './transaction.category.component.html',
  styleUrls: ['./transaction.category.component.css']
})
export class TransactionCategoryComponent implements AfterViewInit {

  constructor(
    public dialog: MatDialog,
  ) {
  }

  openDialogAdd() {
    let dialogRef = this.dialog.open(TransactionCategoryAddComponent);
    dialogRef.afterClosed().subscribe(value => {
      // refresh
    });
  }

  ngAfterViewInit() {
  }
}
