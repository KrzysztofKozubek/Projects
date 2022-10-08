export class Transaction {
  id: number;
  name: string;
  categoryId: number;
  walletId: number;
  bankId: number;
  amount: number;
  timestamp: string;

  public static of(name: string, categoryId: number, walletId: number, bankId: number, amount: number, timestamp: string) {
    let transaction: Transaction = new Transaction();
    transaction.name = name;
    transaction.categoryId = categoryId;
    transaction.walletId = walletId;
    transaction.bankId = bankId;
    transaction.amount = amount;
    transaction.timestamp = timestamp;
    return transaction;
  }
}

// "2018-07-14T17:45:55.948354"
