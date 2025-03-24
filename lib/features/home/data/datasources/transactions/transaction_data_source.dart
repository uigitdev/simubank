import 'package:simubank/simubank.dart';

abstract class TransactionDataSource {
  Future<List<TransactionModel>?> getTransactions();
}
