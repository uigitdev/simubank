import 'package:simubank/simubank.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionDataSource _dataSource;

  TransactionRepositoryImpl(this._dataSource);

  @override
  Stream<List<TransactionEntity>?> getTransactions() async* {
    try {
      yield* _dataSource.getTransactions();
    } catch (_) {
      yield null;
    }
  }
}
