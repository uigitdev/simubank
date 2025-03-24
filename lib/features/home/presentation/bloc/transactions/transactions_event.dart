sealed class TransactionsEvent {
  const TransactionsEvent();
}

class TransactionsGetTransactions extends TransactionsEvent {}

class TransactionsSearchTransaction extends TransactionsEvent {
  final String searched;

  TransactionsSearchTransaction(this.searched);
}

class TransactionsLoadMore extends TransactionsEvent {}