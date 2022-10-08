import {Component, Inject, NgZone, PLATFORM_ID, ViewChild} from '@angular/core';
import {isPlatformBrowser} from '@angular/common';

// amCharts imports
import * as am5 from '@amcharts/amcharts5';
import * as am5percent from '@amcharts/amcharts5/percent';
import am5themes_Animated from '@amcharts/amcharts5/themes/Animated';
import {FormControl, FormGroup} from "@angular/forms";
import {clone} from "@okta/okta-auth-js";
import {MatTableDataSource} from "@angular/material/table";
import {MatSort, Sort} from "@angular/material/sort";
import {MatPaginator} from "@angular/material/paginator";
import {LiveAnnouncer} from "@angular/cdk/a11y";
import {BaseData} from "../_services/base.data";
import {WalletService} from "../wallet/wallet.service";
import {BankService} from "../bank/bank.service";
import {TransactionService} from "../transaction/transaction.service";
import {GroupCategoryService} from "../group-category/group.category.service";
import {TransactionCategoryService} from "../transaction_category/transaction.category.service";

@Component({
  selector: 'app-chart',
  templateUrl: './chart.component.html',
  styleUrls: ['./chart.component.css']
})
export class ChartComponent extends BaseData {

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
      transactionType: this._aggregateType[1]
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
    );
    this.updateChartView();
    this.updateTable();
  }

  canUpdate(): boolean {
    return !(this._wallets?.length == 0 || this._banks?.length == 0 || this._transactions?.length == 0 || this._groupCategories?.length == 0 || this._transactionCategories?.length == 0);
  }

  private _legend: any;
  private _series: any;
  private _chart: any;

  updateChartView() {
    if (!this.canUpdate()) {
      return;
    }
    this.browserOnly(() => {
      if (this.root == null) {
        this.root = am5.Root.new("chartdiv");
        this.root.setThemes([am5themes_Animated.new(this.root)]);
        this._chart = this.root.container.children.push(
          am5percent.PieChart.new(this.root, {
            layout: this.root.horizontalLayout
          })
        );
        // Create Y-axis
        this._series = this._chart.series.push(
          am5percent.PieSeries.new(this.root, {
            valueField: "value",
            categoryField: "category",
            alignLabels: false,
            legendLabelText: "[bold]{category}[/]",
            legendValueText: "[bold]{value} PLN[/]"
          })
        );
        this._series.labels.template.setAll({
          visible: false
        });
        this._series.ticks.template.setAll({
          visible: false
        });
        this._series.slices.template.setAll({
          tooltipText: "{category} {value} PLN",
        });
        this._series.labels.template.set("forceHidden", true);
        this._series.ticks.template.set("forceHidden", true);

        this._series.slices.template.events.on("click", (ev: any) => {
          this._filterGroupCategoryId = [];
          this._series.slices.each((slice: any) => {
            const slicesId = slice?.dataItem?.dataContext?.id;
            if (slice != ev.target) {
              slice.set("active", false);
            } else {
              if (!slice.get("active")) this._filterGroupCategoryId = slicesId;
            }
          });
          this.filters.patchValue({
            groupCategoryId: this._filterGroupCategoryId
          });
          this.updateTable();
        });
        this.filters.patchValue({
          groupCategoryId: null
        });

        // Create legend
        this._legend = this._chart.children.push(am5.Legend.new(this.root, {
          y: am5.percent(50),
          centerY: am5.percent(50),
          layout: this.root.verticalLayout
        }));
      }

      // Set data
      const data: any[] = this._groupCategories?.map(gc => {
        return {
          id: gc?.id,
          category: gc?.name,
          color: gc?.color,
          value: Math.abs(
            this.chartData
              ?.filter(t => JSON.parse(gc?.keywords)?.indexOf(t?.categoryId) != -1)
              ?.reduce((sum, t) => sum + t?.amount, 0)
          ),
        }
      }).filter(s => s?.value > 0)
        .sort((v1, v2) => v1?.value > v2?.value ? 1 : -1);
      const colors = data?.map(d => am5.color(d?.color));
      this._series.get("colors").set("colors", colors);
      this._series.data.setAll(data);
      this._legend.data.setAll(this._series?.dataItems);
      this._series.appear(500, 500);
    });
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

      return this._filterGroupCategoryId == null || categoriesId?.indexOf(t?.categoryId) != -1;
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
