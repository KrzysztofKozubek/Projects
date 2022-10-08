import {AfterViewInit, Component} from '@angular/core';
import {MatDialog} from "@angular/material/dialog";
import {BankAddComponent} from "./add/bank.add.component";

@Component({
  selector: 'app-bank',
  templateUrl: './bank.component.html',
  styleUrls: ['./bank.component.css']
})
export class BankComponent implements AfterViewInit {

  constructor(
    public dialog: MatDialog,
  ) {
  }

  openDialogAdd() {
    let dialogRef = this.dialog.open(BankAddComponent);
    dialogRef.afterClosed().subscribe(value => {
      // refresh
    });
  }

  ngAfterViewInit() {
  }
}
