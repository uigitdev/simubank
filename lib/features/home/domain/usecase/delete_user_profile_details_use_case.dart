import 'package:simubank/simubank.dart';

class DeleteUserProfileUseCase extends AppUseCase<bool, NoData> {
  final UserRepository _repository;

  DeleteUserProfileUseCase(this._repository);

  @override
  Future<bool> call(NoData _) async {
    try {
      return await _repository.deleteUserProfileDetails();
    } catch (_) {
      return false;
    }
  }
}
