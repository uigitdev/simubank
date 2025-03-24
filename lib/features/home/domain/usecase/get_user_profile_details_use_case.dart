import 'package:simubank/simubank.dart';

class GetUserProfileDetailsUseCase
    extends AppStreamUseCase<UserProfileDetailsEntity?, NoData> {
  final UserRepository _repository;

  GetUserProfileDetailsUseCase(this._repository);

  @override
  Stream<UserProfileDetailsEntity?> call(NoData params) async* {
    try {
      final userProfileDetailsList = await _repository.getUserProfileDetails();

      if (userProfileDetailsList != null && userProfileDetailsList.isNotEmpty) {
        yield userProfileDetailsList.first;
      } else {
        yield null;
      }
    } catch (_) {
      yield null;
    }
  }
}
