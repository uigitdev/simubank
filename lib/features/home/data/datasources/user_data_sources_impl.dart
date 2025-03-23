import 'package:simubank/simubank.dart';

class UserDataSourcesImpl extends UserDataSources {
  @override
  Future<List<UserProfileDetailsModel>?> getUserProfileDetails() async {
    return await AppRequestWrapper(GetUserProfileDetailsRequest()).send();
  }
}
