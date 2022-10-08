import {Wallet} from "./wallet";
import {Bank} from "./bank";
import {Transaction} from "./transaction";
import {TransactionCategory} from "./transaction_category";

export class All {
  wallets: Wallet[];
  banks: Bank[];
  transactions: Transaction[];
  transactionCategories: TransactionCategory[];
}
