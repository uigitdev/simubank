import 'package:simubank/simubank.dart';

class TransactionsRemoteDataSourcesImpl extends TransactionsDataSources {
  @override
  Stream<List<TransactionModel>?> getTransactions() async* {
    yield await AppRequestWrapper(GetTransactionsRequest()).send();
  }
}
