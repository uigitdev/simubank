import 'package:simubank/simubank.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final GetTransactionUseCase _getTransactionUseCase;
  final SearchTransactionUseCase _searchTransactionUseCase;

  List<TransactionEntity> _allTransactions = [];

  TransactionsBloc(this._getTransactionUseCase, this._searchTransactionUseCase)
    : super(TransactionsNone()) {
    on<TransactionsGetTransactions>(_onGetGetTransactions);
    on<TransactionsSearchTransaction>(_onSearchTransactions);
  }

  /// Fetches and listens for the transaction data
  ///
  /// Updates the state with the fetched transactions,
  /// and stores the results in _allTransactions.
  /// In case of an error, emits a failure state with the error message.
  void _onGetGetTransactions(
    TransactionsGetTransactions event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      await for (final transactions in _getTransactionUseCase.call(NoData())) {
        _allTransactions = transactions;
        emit(TransactionsLoadedTransactions(transactions));
      }
    } catch (error) {
      emit(TransactionLoadFailed(message: '$error'));
    }
  }

  /// Filter transactions
  ///
  /// Filter transactions based on the search term and updates the state
  /// with the filtered results. In case of an error, emits a failure
  /// state with the error message.
  void _onSearchTransactions(
    TransactionsSearchTransaction event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      final transactions = await _searchTransactionUseCase.call(
        SearchTransactionEntity(
          searched: event.searched,
          transactions: _allTransactions,
        ),
      );

      emit(TransactionsLoadedTransactions(transactions));
    } catch (error) {
      emit(TransactionLoadFailed(message: '$error'));
    }
  }
}
