import 'package:simubank/simubank.dart';

@immutable
class SearchTransactionEntity {
  final String searched;
  final List<TransactionEntity> transactions;

  const SearchTransactionEntity({required this.searched, required this.transactions});
}
