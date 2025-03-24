import 'package:simubank/simubank.dart';

class GetTransactionUseCase
    extends AppStreamUseCase<List<TransactionEntity>, NoData> {
  final TransactionRepository _repository;

  GetTransactionUseCase(this._repository);

  @override
  Stream<List<TransactionEntity>> call(NoData _) async* {
    try {
      await for (final transactions in _repository.getTransactions()) {
        yield transactions ?? [];
      }
    } catch (e) {
      yield [];
    }
  }
}
