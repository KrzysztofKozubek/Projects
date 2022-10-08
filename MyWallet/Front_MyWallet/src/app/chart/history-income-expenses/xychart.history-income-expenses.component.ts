import {Component, Inject, NgZone, PLATFORM_ID, ViewChild} from '@angular/core';
import {isPlatformBrowser} from '@angular/common';
import {clone} from "@okta/okta-auth-js";
import {MatTableDataSource} from "@angular/material/table";
import {MatSort, Sort} from "@angular/material/sort";
import {MatPaginator} from "@angular/material/paginator";
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {BaseData} from "../../_services/base.data";
import {WalletService} from "../../wallet/wallet.service";
import {TransactionService} from "../../transaction/transaction.service";
import {GroupCategoryService} from "../../group-category/group.category.service";
import {TransactionCategoryService} from "../../transaction_category/transaction.category.service";
import {BankService} from "../../bank/bank.service";

// amCharts imports
import * as am5 from '@amcharts/amcharts5';
import * as am5xy from '@amcharts/amcharts5/xy'
import am5themes_Animated from '@amcharts/amcharts5/themes/Animated';

@Component({
  selector: 'app-xychart-history-income-expenses',
  templateUrl: './xychart.history-income-expenses.component.html',
  styleUrls: ['./xychart.history-income-expenses.component.css']
})
export class XychartHistoryIncomeExpensesComponent extends BaseData {

  private root: am5.Root;

  chartData: any[] = [];
  tableData: any[] = [];
  dataSource = new MatTableDataSource(this.tableData);
  displayedColumns: string[] = ['wallet', 'bank', 'name', 'amount', 'category', 'group', 'timestamp'];

  constructor(
    @Inject(PLATFORM_ID) private platformId: any,
    private zone: NgZone,
    private _liveAnnouncer: LiveAnnouncer,
    walletService: WalletService,
    bankService: BankService,
    transactionService: TransactionService,
    groupCategoryService: GroupCategoryService,
    transactionCategoryService: TransactionCategoryService,
  ) {
    super(
      walletService,
      bankService,
      transactionService,
      groupCategoryService,
      transactionCategoryService,
    );
    this.getTransactionCategory();
    this.getGroupCategories();
    this.getWallets();
    this.getBanks();
    this.getTransactions();

    this?.filters?.patchValue({
      aggregateType: this._aggregateType[2]
    });
  }

  refresh(): void {
    this.updateChartData();
  }

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  // Run the function only in the browser
  browserOnly(f: () => void) {
    if (isPlatformBrowser(this.platformId)) {
      this.zone.runOutsideAngular(() => {
        f();
      });
    }
  }

  updateChartData() {
    if (!this.canUpdate()) {
      return;
    }
    this.chartData = clone(this._transactions
      .filter(this.funFilterTransactionType())
      .filter(this.funFilterWalletId())
      .filter(this.funFilterBankId())
      .filter(this.funFilterMinDate())
      .filter(this.funFilterMaxDate())
      .filter(this.funFilterTransactionCategories())
    );
    this.updateChartView();
    this.updateTable();
  }

  canUpdate(): boolean {
    return !(this._wallets?.length == 0 || this._banks?.length == 0 || this._transactions?.length == 0 || this._groupCategories?.length == 0 || this._transactionCategories?.length == 0);
  }

  private _legend: any;
  private _xAxed: any;
  private _yAxed: any;
  private _chart: any;
  private _seriesIncome: any;
  private _seriesExpenses: any;

  updateChartView() {
    if (!this.canUpdate()) {
      return;
    }
    if (this.root == null) {
      this.root = am5.Root.new("chartdiv");
      this.root.setThemes([am5themes_Animated.new(this.root)]);
      this._chart = this.root.container.children.push(
        am5xy.XYChart.new(this.root, {
          panY: false,
          wheelY: "zoomX",
          layout: this.root.verticalLayout
        })
      );
      // Create Y-axis
      this._yAxed = this._chart.yAxes.push(
        am5xy.ValueAxis.new(this.root, {
          renderer: am5xy.AxisRendererY.new(this.root, {})
        })
      );
      // Create X-axis
      this._xAxed = this._chart.xAxes.push(
        am5xy.CategoryAxis.new(this.root, {
          maxDeviation: 0.2,
          renderer: am5xy.AxisRendererX.new(this.root, {}),
          categoryField: "date"
        })
      );
      // Create series
      this._seriesIncome = this._chart.series.push(
        am5xy.ColumnSeries.new(this.root, {
          name: "Income",
          xAxis: this._xAxed,
          yAxis: this._yAxed,
          valueYField: "valueIncome",
          categoryXField: "date",
          tooltip: am5.Tooltip.new(this.root, {}),
          fill: am5.color("#2E7D32"),
          stroke: am5.color("#2E7D32"),
        })
      );
      this._seriesExpenses = this._chart.series.push(
        am5xy.ColumnSeries.new(this.root, {
          name: "Expenses",
          xAxis: this._xAxed,
          yAxis: this._yAxed,
          valueYField: "valueExpenses",
          categoryXField: "date",
          tooltip: am5.Tooltip.new(this.root, {}),
          fill: am5.color("#C62828"),
          stroke: am5.color("#C62828")
        })
      );
      this._seriesIncome.columns.template.set("tooltipText", "{date}: {valueY}");
      this._seriesExpenses.columns.template.set("tooltipText", "{date}: {valueY}");
      // Add scroll bar
      this._chart.set("scrollbarX", am5.Scrollbar.new(this.root, {
        fill: am5.color(0x000000),
        fillOpacity: 0.2,
        cornerRadiusTR: 0,
        cornerRadiusBR: 0,
        cornerRadiusTL: 0,
        cornerRadiusBL: 0,
        height: 5,
        orientation: "horizontal"
      }));
      // Add legend
      this._legend = this._chart.children.push(am5.Legend.new(this.root, {}));
      this._legend.data.setAll(this._chart.series.values);
    }
    const keyAggType: string = this._filterAggregateType ? this._filterAggregateType : "YEAR";
    // @ts-ignore
    const aggType: any = this.DATE_CUT[keyAggType];
    let dd = new Map<string, any>();
    for (let i = 0; i < this.chartData?.length; i++) {
      const key: string = this.chartData?.[i]?.timestamp?.substring(0, aggType);
      const amount: number = this.chartData?.[i]?.amount;
      if (dd.has(key)) {
        const income = amount > 0 ? amount + dd.get(key).income : dd.get(key).income;
        const expenses = amount < 0 ? Math.abs(amount) + dd.get(key).expenses : dd.get(key).expenses;
        dd.set(key, {income, expenses});
      } else {
        const income = amount > 0 ? amount : 0;
        const expenses = amount < 0 ? Math.abs(amount) : 0;
        dd.set(key, {income, expenses});
      }
    }
    let data = [];
    for (let [key, value] of dd) {
      data.push({
        date: key,
        valueIncome: value.income,
        valueExpenses: value.expenses
      });
    }
    data = data.sort((d1, d2) => new Date(d1.date) < new Date(d2.date) ? -1 : 1);
    this._xAxed.data.setAll(data);
    this._seriesIncome.data.setAll(data);
    this._seriesExpenses.data.setAll(data);
  }

  updateTable() {
    if (!this.canUpdate()) {
      return;
    }
    this.tableData = clone(this.chartData?.filter(t => {
      // categories id from filter
      const categoriesId: number[] = this._groupCategories
        ?.filter(gc => this._filterGroupCategoryId.indexOf(gc.id) != -1)
        ?.map(gc => JSON.parse(gc.keywords))
        ?.pop();

      return this._filterGroupCategoryId?.length == 0 || categoriesId?.indexOf(t?.categoryId) != -1;
    }).map(t => {
      const category = this._transactionCategories?.filter(tc => tc?.id == t?.categoryId)?.pop();
      const categoryName = category?.name;
      const group = this._groupCategories?.filter(gc => JSON.parse(gc?.keywords).indexOf(category?.id) != -1)?.pop();
      const groupName = group?.name;
      const groupColor = group?.color;

      const bank = this._banks?.filter(b => b?.id == t?.bankId)?.pop();
      const bankName = bank?.name;

      const wallet = this._wallets?.filter(w => w?.id == t?.walletId)?.pop();
      const walletName = wallet?.name;
      return {
        ...wallet,
        ...bank,
        ...t,
        wallet: walletName,
        bank: bankName,
        categoryName: categoryName,
        groupName: groupName,
        groupColor: groupColor,
      }
    }));
    this.dataSource = new MatTableDataSource(this.tableData);
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }

  ngAfterViewInit() {
    this.updateChartData();
  }

  ngOnDestroy() {
    // Clean up chart when the component is removed
    this.browserOnly(() => {
      if (this.root) {
        this.root.dispose();
      }
    });
  }

  announceSortChange(sortState: Sort) {
    if (sortState?.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce('Sorting cleared');
    }
  }
}
