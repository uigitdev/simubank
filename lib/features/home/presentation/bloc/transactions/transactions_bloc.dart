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

  void _onGetGetTransactions(
    TransactionsGetTransactions event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      final transactions = await _getTransactionUseCase.call(NoData());
      _allTransactions = transactions;
      emit(TransactionsLoadedTransactions(transactions));
    } catch (error) {
      emit(TransactionLoadFailed(message: '$error'));
    }
  }

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
