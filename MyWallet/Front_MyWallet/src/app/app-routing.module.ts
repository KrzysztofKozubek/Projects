import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent} from "./login/login.component";
import {WalletComponent} from "./wallet/wallet.component";
import {BankComponent} from "./bank/bank.component";
import {TransactionCategoryComponent} from "./transaction_category/transaction.category.component";
import {TransactionComponent} from "./transaction/transaction.component";
import {ImportComponent} from "./import/import.component";
import {ChartComponent} from "./chart/chart.component";
import {GroupCategoryComponent} from "./group-category/group-category.component";
import {PieChartGroupTransactionComponent} from "./chart/group_category/piechart.group.transaction.component";
import {
  XychartHistoryIncomeExpensesComponent
} from "./chart/history-income-expenses/xychart.history-income-expenses.component";

const routes: Routes = [
  { path: 'chart/pie', component: PieChartGroupTransactionComponent },
  { path: 'chart/xy', component: XychartHistoryIncomeExpensesComponent },
  { path: 'login', component: LoginComponent },
  { path: 'wallet', component: WalletComponent },
  { path: 'bank', component: BankComponent },
  { path: 'transaction/category', component: TransactionCategoryComponent },
  { path: 'transaction/category/group', component: GroupCategoryComponent },
  { path: 'transaction', component: TransactionComponent },
  { path: 'import', component: ImportComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
