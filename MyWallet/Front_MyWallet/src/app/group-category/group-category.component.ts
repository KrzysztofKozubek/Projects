import {AfterViewInit, Component} from '@angular/core';
import {MatDialog} from "@angular/material/dialog";
import {GroupCategoryAddComponent} from "./add/group-category.add.component";

@Component({
  selector: 'app-group-category',
  templateUrl: './group-category.component.html',
  styleUrls: ['./group-category.component.css']
})
export class GroupCategoryComponent implements AfterViewInit {

  constructor(
    public dialog: MatDialog,
  ) {
  }

  openDialogAdd() {
    let dialogRef = this.dialog.open(GroupCategoryAddComponent);
    dialogRef.afterClosed().subscribe(value => {
      // refresh
    });
  }

  ngAfterViewInit(): void {
  }

}
