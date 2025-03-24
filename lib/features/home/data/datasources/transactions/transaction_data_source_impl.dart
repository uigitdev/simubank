import 'package:simubank/simubank.dart';

class TransactionDataSourceImpl extends TransactionDataSource {
  @override
  Stream<List<TransactionModel>?> getTransactions() async* {
    yield await AppRequestWrapper(GetTransactionsRequest()).send();
  }
}
