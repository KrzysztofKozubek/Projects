import {AfterViewInit, Component} from '@angular/core';
import {MatDialog} from "@angular/material/dialog";
import {TransactionAddComponent} from "./add/transaction.component.add";

@Component({
  selector: 'app-transaction',
  templateUrl: './transaction.component.html',
  styleUrls: ['./transaction.component.css']
})
export class TransactionComponent implements AfterViewInit {

  constructor(
    public dialog: MatDialog,
  ) {
  }

  openDialogAdd() {
    let dialogRef = this.dialog.open(TransactionAddComponent);
    dialogRef.afterClosed().subscribe(value => {
      // refresh
    });
  }

  ngAfterViewInit() {
  }

}
