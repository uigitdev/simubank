import 'package:simubank/simubank.dart';

class GetUserProfileDetailsUseCase
    extends AppUseCase<UserProfileDetailsEntity?, NoData> {
  final UserRepository _repository;

  GetUserProfileDetailsUseCase(this._repository);

  @override
  Future<UserProfileDetailsEntity?> call(NoData params) async {
    try {
      final userProfileDetailsList = await _repository.getUserProfileDetails();

      if (userProfileDetailsList == null || userProfileDetailsList.isEmpty) {
        return Future.error(ErrorHint(AppStrings.profileNotFound));
      }

      return userProfileDetailsList.first;
    } catch (_) {
      return null;
    }
  }
}
