import 'package:simubank/simubank.dart';

class GetTransactionUseCase
    extends AppStreamUseCase<List<TransactionEntity>, NoData> {
  final TransactionRepository _repository;

  GetTransactionUseCase(this._repository);

  @override
  Stream<List<TransactionEntity>> call(NoData _) async* {
    try {
      yield await _repository.getTransactions() ?? [];
    } catch (e) {
      yield [];
    }
  }
}
