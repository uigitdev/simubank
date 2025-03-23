import 'package:simubank/simubank.dart';

class SearchTransactionUseCase extends AppUseCase<List<TransactionEntity>, SearchTransactionEntity> {
  @override
  Future<List<TransactionEntity>> call(SearchTransactionEntity searchTransaction,) async {
    if (searchTransaction.searched.isEmpty) {
      return searchTransaction.transactions;
    } else {
      return searchTransaction.transactions
          .where((transaction) => transaction.merchant.toLowerCase()
          .contains(searchTransaction.searched.toLowerCase()))
          .toList();
    }
  }
}
