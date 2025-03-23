import 'package:simubank/simubank.dart';

sealed class TransactionsEvent {
  const TransactionsEvent();
}

class TransactionsGetTransactions extends TransactionsEvent {}

class TransactionsSearchTransaction extends TransactionsEvent {
  final List<TransactionEntity> transactions;
  final String searched;

  TransactionsSearchTransaction(this.searched, this.transactions);
}
