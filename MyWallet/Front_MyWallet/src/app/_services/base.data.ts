import {Wallet} from "../_model/wallet";
import {Bank} from "../_model/bank";
import {GroupCategory} from "../_model/group_category";
import {TransactionCategory} from "../_model/transaction_category";
import {Transaction} from "../_model/transaction";
import {WalletService} from "../wallet/wallet.service";
import {BankService} from "../bank/bank.service";
import {TransactionService} from "../transaction/transaction.service";
import {GroupCategoryService} from "../group-category/group.category.service";
import {TransactionCategoryService} from "../transaction_category/transaction.category.service";
import {FormControl, FormGroup} from "@angular/forms";

export abstract class BaseData {

  _wallets: Wallet[] = [];
  _banks: Bank[] = [];
  _groupCategories: GroupCategory[] = [];
  _transactionCategories: TransactionCategory[] = [];
  _transactions: Transaction[] = [];

  walletService: WalletService;
  bankService: BankService;
  transactionService: TransactionService;
  groupCategoryService: GroupCategoryService;
  transactionCategoryService: TransactionCategoryService;

  _transactionType: string[] = ["income", "expenses"];
  _aggregateType: string[] = ["DAY", "MONTH", "YEAR"];

  _filterAggregateType: string | null = null;
  _filterTransactionType: string | null = null;
  _filterGroupCategoryId: number[] = [];
  _filterTransactionCategoriesId: number[] = [];
  _filterWalletId: number[] = [];
  _filterBankId:number[] = [];
  _filterMinDate: string | null = null;
  _filterMaxDate: string | null = null;

  protected constructor(
    walletService: WalletService,
    bankService: BankService,
    transactionService: TransactionService,
    groupCategoryService: GroupCategoryService,
    transactionCategoryService: TransactionCategoryService,
  ) {
    this.walletService = walletService;
    this.bankService = bankService;
    this.transactionService = transactionService;
    this.groupCategoryService = groupCategoryService;
    this.transactionCategoryService = transactionCategoryService;

    this.filters?.controls?.walletId?.valueChanges?.subscribe(value => {
      this._filterWalletId = value;
      this.refresh();
    });
    this.filters?.controls?.bankId?.valueChanges?.subscribe(value => {
      this._filterBankId = value;
      this.refresh();
    });
    this.filters?.controls?.transactionType?.valueChanges?.subscribe(value => {
      this._filterTransactionType = value;
      this.refresh();
    });
    this.filters?.controls?.aggregateType?.valueChanges?.subscribe(value => {
      this._filterAggregateType = value;
      this.refresh();
    });
    this.filters?.controls?.groupCategoryService?.valueChanges?.subscribe(value => {
      this._filterGroupCategoryId = value;
      this.refresh();
    });
    this.filters?.controls?.minDate?.valueChanges?.subscribe(value => {
      this._filterMinDate = value;
      this.refresh();
    });
    this.filters?.controls?.maxDate?.valueChanges?.subscribe(value => {
      this._filterMaxDate = value;
      this.refresh();
    });
    this.filters?.controls?.transactionCategories?.valueChanges?.subscribe(value => {
      this._filterTransactionCategoriesId = value;
      this.refresh();
    });
  }

  funFilterWalletId() {
    return (i: any) => this._filterWalletId?.length == 0 || this._filterWalletId?.indexOf(i?.walletId) != -1;
  }

  funFilterBankId() {
    return (i: any) => this._filterBankId?.length == 0 || this._filterBankId?.indexOf(i?.bankId) != -1;
  }

  funFilterGroupCategoryId() {
    return (i: any) => this._filterGroupCategoryId?.length == 0 || this._filterGroupCategoryId?.indexOf(i?.categoryId) != -1;
  }

  funFilterTransactionType() {
    return (i: any) => (this._filterTransactionType == null)
      || (this._filterTransactionType == this._transactionType[0] && i.amount > 0)
      || (this._filterTransactionType == this._transactionType[1] && i.amount < 0);
  }

  funFilterMinDate() {
    return (i: any) => {
      return this._filterMinDate == null || new Date(this._filterMinDate) <= new Date(i.timestamp);
    }
  }

  funFilterMaxDate() {
    return (i: any) => {
      return this._filterMaxDate == null || new Date(this._filterMaxDate) >= new Date(i.timestamp);
    }
  }

  funFilterTransactionCategories() {
    return (i: any) => {
      return this._filterTransactionCategoriesId?.length == 0 || this._filterTransactionCategoriesId?.indexOf(i?.categoryId) != -1;
    }
  }

  abstract refresh(): void;

  public DATE_CUT = {
    DAY: 10,
    MONTH: 7,
    YEAR: 4
  }

  filters: FormGroup = new FormGroup({
    walletId: new FormControl(),
    bankId: new FormControl(),
    minDate: new FormControl(),
    maxDate: new FormControl(),

    groupCategoryId: new FormControl(),
    transactionCategories: new FormControl(),
    transactionType: new FormControl(),
    aggregateType: new FormControl(),
  });

  clearFilter(formControlName: string) {
    this.filters.patchValue({
      [formControlName]: null
    });
  }

  selectAllFilter(formControlName: string, items: any[]) {
    this.filters.patchValue({
      [formControlName]: items?.map(i => i?.id)
    });
  }

  getWallets(): void {
    this.walletService.subscribeGet(
      (r: Wallet[]) => this._wallets = r?.sort(this.SORT_ALPHABETIC())
      , () => this.refresh()
    );
  }

  getBanks() {
    return this.bankService.subscribeGet(
      (r: Bank[]) => this._banks = r.sort(this.SORT_ALPHABETIC())
      , () => this.refresh()
    );
  }

  getTransactionCategory() {
    this.transactionCategoryService.subscribeGet(
      (r: TransactionCategory[]) => this._transactionCategories = r.sort(this.SORT_ALPHABETIC())
      , () => this.refresh()
    );
  }

  getGroupCategories() {
    this.groupCategoryService.subscribeGet(
      (r: GroupCategory[]) => this._groupCategories = r.sort(this.SORT_ALPHABETIC())
      , () => this.refresh()
    );
  }

  getTransactions() {
    this.transactionService.subscribeGet(
      (r: Transaction[]) => this._transactions = r
      , () => this.refresh()
    );
  }

  SORT_ALPHABETIC() {
    return (i1: any, i2: any) => i1?.name?.toUpperCase() < i2?.name?.toUpperCase() ? -1 : 1;
  }

  addTransactions(transactions: Transaction[], index: number = 0) {
    if (index < transactions?.length) {
      const i = index + 1;
      this.transactionService.funAdd(
        transactions[index],
        () => this.addTransactions(transactions, i),
        () => this.addTransactions(transactions, i));
    }
  }

  removeTransactions(transactionsId: number[], index: number = 0) {
    if (index < transactionsId?.length) {
      const i = index + 1;
      this.transactionService.funRemove(
        transactionsId[index],
        () => this.removeTransactions(transactionsId, i),
        () => this.removeTransactions(transactionsId, i));
    }
  }
}
