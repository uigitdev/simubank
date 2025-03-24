import 'package:simubank/simubank.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionsDataSources _remoteDateSources;
  final TransactionsDataSources _cacheDataSources;

  TransactionRepositoryImpl(this._remoteDateSources, this._cacheDataSources);

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
          await _cacheDataSources.cacheTransactions(remoteTransactions);
          yield remoteTransactions;
        }
      }

    } catch (_) {
      yield* _cacheDataSources.getTransactions();
    }
  }

  @override
  Future<bool> deleteCachedTransactions() async {
    try {
      return await _cacheDataSources.deleteCachedTransactions();
    } catch(_) {
      return false;
    }
  }
}
