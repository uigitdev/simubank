import 'package:simubank/simubank.dart';

sealed class TransactionsState extends Equatable {
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

class TransactionLoadFailed extends TransactionsState implements ErrorState {
  @override
  final String message;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  const TransactionLoadFailed({
    required this.message,
    this.error,
    this.stackTrace,
  });
}
