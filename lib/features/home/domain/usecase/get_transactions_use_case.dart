import 'package:simubank/simubank.dart';

class GetTransactionUseCase
    extends AppUseCase<List<TransactionEntity>, NoData> {
  final TransactionRepository _repository;

  GetTransactionUseCase(this._repository);

  @override
  Future<List<TransactionEntity>> call(NoData _) async {
    try {
      return await _repository.getTransactions() ?? [];
    } catch (_) {
      return [];
    }
  }
}
