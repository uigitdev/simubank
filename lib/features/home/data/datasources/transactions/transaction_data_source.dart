import 'package:simubank/simubank.dart';

abstract class TransactionDataSource {
  Stream<List<TransactionModel>?> getTransactions();
}
