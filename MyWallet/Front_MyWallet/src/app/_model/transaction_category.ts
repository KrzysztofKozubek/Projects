export class TransactionCategory {
  id: number;
  name: string;
  keywords: string;
  default: boolean;

  public static clone(transactionCategory: TransactionCategory): TransactionCategory {
    return {...transactionCategory, default: false};
  }

  public static of(name: string, keywords: string): TransactionCategory {
    let transactionCategory: TransactionCategory = new TransactionCategory();
    transactionCategory.name = name;
    transactionCategory.keywords = keywords;
    transactionCategory.default = false;
    return transactionCategory;
  }
}
