import 'package:simubank/simubank.dart';

class TransactionsCacheDataSourcesImpl extends TransactionsDataSources{
  @override
  Stream<List<TransactionModel>?> getTransactions() async* {

  }

  @override
  Future<bool> deleteCachedTransactions() {
    // TODO: implement deleteCachedTransactions
    return super.deleteCachedTransactions();
  }

  @override
  Future<bool> cacheTransactions(List<TransactionModel> transactions) {
    // TODO: implement cacheTransactions
    return super.cacheTransactions(transactions);
  }
}