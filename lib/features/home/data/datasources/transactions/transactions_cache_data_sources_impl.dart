import 'package:simubank/simubank.dart';

class TransactionsCacheDataSourcesImpl extends TransactionsDataSources {
  final _databaseHelper = TransactionsDatabaseHelper();

  /// Get transactions from database.
  ///
  /// Fetch transactions by stored [sessionId].
  /// Parse list items into [TransactionModel] then yield it as a [List].
  /// In case of an error yield null.
  @override
  Stream<List<TransactionModel>?> getTransactions() async* {
    try {
      final transactionsJson = await _databaseHelper.getTransactionsBySession();

      if (transactionsJson.isNotEmpty) {
        yield transactionsJson
            .map((json) => TransactionModel.fromJson(json))
            .toList();
      } else {
        yield null;
      }
    } catch (_) {
      yield null;
    }
  }

  /// Delete cached transactions from database.
  @override
  Future<bool> deleteCachedTransactions() async {
    try {
      await _databaseHelper.deleteTransactionsBySession();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Store transactions into database.
  @override
  Future<bool> cacheTransactions(List<TransactionModel> transactions) async {
    try {
      for (var transaction in transactions) {
        await _databaseHelper.insertTransaction(
          TransactionModel(
            id: transaction.id,
            userId: transaction.userId,
            date: transaction.date,
            merchant: transaction.merchant,
            amount: transaction.amount,
            currency: transaction.currency,
            description: transaction.description,
            fromAccount: transaction.fromAccount,
            toAccount: transaction.toAccount,
            category: transaction.category,
          ),
        );
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
