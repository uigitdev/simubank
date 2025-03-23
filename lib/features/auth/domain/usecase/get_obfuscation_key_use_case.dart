import 'package:simubank/simubank.dart';

class GetObfuscationKeyUseCase
    extends AppUseCase<ObfuscationKeyEntity?, NoData> {
  final AuthRepository _repository;

  GetObfuscationKeyUseCase(this._repository);

  @override
  Future<ObfuscationKeyEntity?> call(NoData params) async {
    try {
      return await _repository.getObfuscationKey();
    } catch (_) {
      return null;
    }
  }
}
