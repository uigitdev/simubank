import 'package:simubank/simubank.dart';

sealed class TransactionsState extends Equatable{
  const TransactionsState();

  @override
  List<Object?> get props => [];
}

class TransactionsNone extends TransactionsState {}

class TransactionsLoadedTransactions extends TransactionsState {
  final List<TransactionEntity> transactions;

  const TransactionsLoadedTransactions(this.transactions);

  @override
  List<Object?> get props => transactions;
}

class TransactionLoadFailed extends TransactionsState {
  final String message;

  const TransactionLoadFailed({required this.message});
}
