import 'package:simubank/simubank.dart';

class UserDataSourcesImpl extends UserDataSources {
  @override
  Stream<List<UserProfileDetailsModel>?> getUserProfileDetails() async* {
    yield await AppRequestWrapper(GetUserProfileDetailsRequest()).send();
  }
}
