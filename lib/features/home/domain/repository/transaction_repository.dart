import 'package:simubank/simubank.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>?> getTransactions();
}
