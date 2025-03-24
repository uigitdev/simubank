import 'package:simubank/simubank.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final GetTransactionUseCase _getTransactionUseCase;
  final SearchTransactionUseCase _searchTransactionUseCase;
  final DeleteCachedTransactionsUseCase _deleteCachedTransactionsUseCase;

  StreamSubscription<dynamic>? _eventSubscription;

  List<TransactionEntity> _allTransactions = [];
  final _transactionsToShow = <int, TransactionEntity>{};
  final _initialLoadCount = 10;
  final _loadMoreCount = 4;

  TransactionsBloc(
    this._getTransactionUseCase,
    this._searchTransactionUseCase,
    this._deleteCachedTransactionsUseCase,
  ) : super(TransactionsNone()) {
    on<TransactionsGetTransactions>(_onGetGetTransactions);
    on<TransactionsSearchTransaction>(_onSearchTransactions);
    on<TransactionsLoadMore>(_onLoadMore);
    _observeEventDispatcher();
  }

  void _observeEventDispatcher() {
    _eventSubscription = EventDispatcher().stream.listen((event) {
      if (event is AuthLogout) {
        _onDeleteCachedTransactions();
      }
    });
  }

  void _onLoadMore(
    TransactionsLoadMore event,
    Emitter<TransactionsState> emit,
  ) async {
    try {

      for(var transaction in _allTransactions.getSublist(_transactionsToShow.length, _loadMoreCount)){
        _transactionsToShow.putIfAbsent(transaction.id, () => transaction);
      }
      emit(TransactionsLoadedTransactions(_transactionsToShow.values.toList()));
    } catch (_) {
      // unused
    }
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

        for(var transaction in _allTransactions.getSublist(_transactionsToShow.length, _initialLoadCount)){
          _transactionsToShow.putIfAbsent(transaction.id, () => transaction);
        }

        emit(TransactionsLoadedTransactions(_transactionsToShow.values.toList()));
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

  void _onDeleteCachedTransactions() async {
    try {
      await _deleteCachedTransactionsUseCase.call(NoData());
    } catch (_) {
      // unused
    }
  }

  @override
  Future<void> close() async {
    await _eventSubscription?.cancel();
    super.close();
  }
}
