import 'package:simubank/simubank.dart';

class SearchTransactionEntity {
  final String searched;
  final List<TransactionEntity> transactions;

  SearchTransactionEntity({required this.searched, required this.transactions});
}
