import 'package:simubank/simubank.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionsDataSources _remoteDateSources;
  final TransactionsDataSources _cacheDataSources;

  TransactionRepositoryImpl(this._remoteDateSources, this._cacheDataSources);

  /// Get transactions.
  ///
  /// At first try to get cached transactions and yield it if the result list
  /// is not null and not empty.
  /// Then start fetching remote transactions.
  /// Finally if result is not null delete cached transactions then store
  /// new transactions into database.
  /// In case of an error yield cached transactions.
  @override
  Stream<List<TransactionEntity>?> getTransactions() async* {
    try {

      await for(final cachedTransactions in _cacheDataSources.getTransactions()){
        if(cachedTransactions != null && cachedTransactions.isNotEmpty) {
          yield cachedTransactions;
        }
      }

      await for(final remoteTransactions in _remoteDateSources.getTransactions()){
        if(remoteTransactions != null) {
          yield remoteTransactions;
          await _cacheDataSources.deleteCachedTransactions();
          await _cacheDataSources.cacheTransactions(remoteTransactions);
        }
      }

    } catch (_) {
      yield* _cacheDataSources.getTransactions();
    }
  }

  /// Delete cached transactions from database.
  ///
  /// return true value if it is success
  /// otherwise return false.
  @override
  Future<bool> deleteCachedTransactions() async {
    try {
      return await _cacheDataSources.deleteCachedTransactions();
    } catch(_) {
      return false;
    }
  }
}
