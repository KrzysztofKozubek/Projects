export class Wallet {
  id: number;
  name: string;
  amount: number;

  public static of(name: string, amount: number) {
    let wallet: Wallet = new Wallet();
    wallet.name = name;
    wallet.amount = amount;
    return wallet;
  }
}
