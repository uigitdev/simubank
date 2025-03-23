import 'package:simubank/simubank.dart';

sealed class TransactionsState {
  const TransactionsState();
}

class TransactionsNone extends TransactionsState {}

class TransactionsLoadedTransactions extends TransactionsState {
  final List<TransactionEntity> transactions;

  TransactionsLoadedTransactions(this.transactions);
}

class TransactionLoadFailed extends TransactionsState {
  final String message;

  TransactionLoadFailed({required this.message});
}
