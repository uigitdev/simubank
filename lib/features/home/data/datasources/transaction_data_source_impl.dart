import 'package:simubank/simubank.dart';

class TransactionDataSourceImpl extends TransactionDataSource {
  @override
  Future<List<TransactionModel>?> getTransactions() async {
    return await AppRequestWrapper(GetTransactionsRequest()).send();
  }
}
