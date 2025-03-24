import 'package:simubank/simubank.dart';

abstract class TransactionRepository {
  Stream<List<TransactionEntity>?> getTransactions();
}
