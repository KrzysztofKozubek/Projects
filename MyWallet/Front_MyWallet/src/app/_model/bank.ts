export class Bank {
  id: number;
  walletId: number;
  name: string;
  amount: number;

  public static of(walletId: number, name: string, amount: number) {
    let bank: Bank = new Bank();
    bank.name = name;
    bank.walletId = walletId;
    bank.amount = amount;
    return bank;
  }
}
