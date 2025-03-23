import 'package:simubank/simubank.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionDataSource _dataSource;

  TransactionRepositoryImpl(this._dataSource);

  @override
  Future<List<TransactionEntity>?> getTransactions() async {
    try {
      return await _dataSource.getTransactions();
    } catch (e) {
      return null;
    }
  }
}
