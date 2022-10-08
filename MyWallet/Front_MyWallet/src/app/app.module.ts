import {NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {AppRoutingModule} from './app-routing.module';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

// Angular Material
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatInputModule} from '@angular/material/input';
import {MatCardModule} from '@angular/material/card';
import {MatMenuModule} from '@angular/material/menu';
import {MatIconModule} from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';
import {MatTableModule} from '@angular/material/table';
import {MatSlideToggleModule} from '@angular/material/slide-toggle';
import {MatSelectModule} from '@angular/material/select';
import {MatNativeDateModule, MatOptionModule} from '@angular/material/core';
import {MatSnackBarModule} from "@angular/material/snack-bar";
import {MatGridListModule} from "@angular/material/grid-list";
import {MatListModule} from "@angular/material/list";

// My component
import {AlertModule} from "./_alert";

import {JwtInterceptor} from "./_interceptor/jwt.interceptor";
// import {CorsInterceptor} from "./_interceptor/cors.interceptor";
import {ErrorInterceptor} from "./_interceptor/error.interceptor";

import {AppComponent} from './app.component';
import {LoginComponent} from './login/login.component';
import {WalletComponent} from "./wallet/wallet.component";
import {BankComponent} from "./bank/bank.component";
import {MatPaginatorModule} from "@angular/material/paginator";
import {MatSortModule} from "@angular/material/sort";
import {TransactionCategoryComponent} from "./transaction_category/transaction.category.component";
import {TransactionComponent} from "./transaction/transaction.component";
import {MatDatepickerModule} from "@angular/material/datepicker";
// import {NgxMatFileInputModule} from "@angular-material-components/file-input";
import {MatStepperModule} from "@angular/material/stepper";
import {ImportComponent} from "./import/import.component";
import {MatChipsModule} from "@angular/material/chips";
import {TransactionCategoryEditComponent} from "./transaction_category/edit/transaction.category.edit.component";
import {MatDialogModule} from "@angular/material/dialog";
import {TransactionCategoryAddComponent} from "./transaction_category/add/transaction.category.add.component";
import {TransactionCategoryGetComponent} from "./transaction_category/get/transaction.category.get.component";
import {TransactionGetComponent} from "./transaction/get/transaction.get.component";
import {TransactionEditComponent} from "./transaction/edit/transaction.component.edit";
import {TransactionAddComponent} from "./transaction/add/transaction.component.add";
import {BankGetComponent} from "./bank/get/bank.get.component";
import {BankAddComponent} from "./bank/add/bank.add.component";
import {BankEditComponent} from "./bank/edit/bank.edit.component";
import {WalletGetComponent} from "./wallet/get/wallet.get.component";
import {WalletEditComponent} from "./wallet/edit/wallet.edit.component";
import {WalletAddComponent} from "./wallet/add/wallet.add.component";
import { ChartComponent } from './chart/chart.component';
import { GroupCategoryComponent } from './group-category/group-category.component';
import {GroupCategoryAddComponent} from "./group-category/add/group-category.add.component";
import {GroupCategoryEditComponent} from "./group-category/edit/group-category.edit.component";
import {GroupCategoryGetComponent} from "./group-category/get/group-category.get.component";
import {PieChartGroupTransactionComponent} from "./chart/group_category/piechart.group.transaction.component";
import {
  XychartHistoryIncomeExpensesComponent
} from "./chart/history-income-expenses/xychart.history-income-expenses.component";


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    WalletComponent,
    BankComponent,
    TransactionComponent,
    TransactionCategoryComponent,
    ImportComponent,
    TransactionCategoryEditComponent,
    TransactionCategoryAddComponent,
    TransactionCategoryGetComponent,
    TransactionGetComponent,
    TransactionAddComponent,
    TransactionEditComponent,
    BankGetComponent,
    BankAddComponent,
    BankEditComponent,
    WalletGetComponent,
    WalletAddComponent,
    WalletEditComponent,
    ChartComponent,
    GroupCategoryComponent,
    GroupCategoryAddComponent,
    GroupCategoryEditComponent,
    GroupCategoryGetComponent,
    PieChartGroupTransactionComponent,
    XychartHistoryIncomeExpensesComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    FormsModule,
    MatToolbarModule,
    MatInputModule,
    MatCardModule,
    MatMenuModule,
    MatIconModule,
    MatButtonModule,
    MatTableModule,
    MatSlideToggleModule,
    MatSelectModule,
    MatOptionModule,
    MatGridListModule,
    ReactiveFormsModule,
    MatSnackBarModule,
    MatListModule,
    AlertModule,
    MatPaginatorModule,
    MatSortModule,
    MatDatepickerModule,
    MatNativeDateModule,
    // NgxMatFileInputModule,
    MatStepperModule,
    MatChipsModule,
    MatDialogModule
  ],
  providers: [
    {provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true},
    // {provide: HTTP_INTERCEPTORS, useClass: CorsInterceptor, multi: true},
    {provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true},
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}
