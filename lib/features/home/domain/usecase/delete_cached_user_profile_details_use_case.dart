import 'package:simubank/simubank.dart';

class DeleteCachedUserProfileUseCase extends AppUseCase<bool, NoData> {
  final UserRepository _repository;

  DeleteCachedUserProfileUseCase(this._repository);

  @override
  Future<bool> call(NoData _) async {
    try {
      return await _repository.deleteUserProfileDetails();
    } catch (_) {
      return false;
    }
  }
}
