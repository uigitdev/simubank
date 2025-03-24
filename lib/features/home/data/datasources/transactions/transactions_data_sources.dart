import 'package:simubank/simubank.dart';

abstract class TransactionsDataSources {
  Stream<List<TransactionModel>?> getTransactions();
  Future<bool> cacheTransactions(List<TransactionModel> transactions) {
    return Future.value(false);
  }
  Future<bool> deleteCachedTransactions() {
    return Future.value(false);
  }
}
