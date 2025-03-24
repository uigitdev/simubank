import 'package:simubank/simubank.dart';

class DeleteCachedTransactionsUseCase extends AppUseCase<bool, NoData> {
  final TransactionRepository _repository;

  DeleteCachedTransactionsUseCase(this._repository);

  @override
  Future<bool> call(NoData _) async {
    try {
      return await _repository.deleteCachedTransactions();
    } catch (_) {
      return false;
    }
  }
}
