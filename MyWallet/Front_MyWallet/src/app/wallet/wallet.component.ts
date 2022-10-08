import {AfterViewInit, Component} from '@angular/core';
import {MatDialog} from "@angular/material/dialog";
import {WalletAddComponent} from "./add/wallet.add.component";

@Component({
  selector: 'app-wallet',
  templateUrl: './wallet.component.html',
  styleUrls: ['./wallet.component.css']
})
export class WalletComponent implements AfterViewInit {

  constructor(
    public dialog: MatDialog,
  ) {
  }

  openDialogAdd() {
    let dialogRef = this.dialog.open(WalletAddComponent);
    dialogRef.afterClosed().subscribe(value => {
      // refresh
    });
  }

  ngAfterViewInit() {
  }
}
