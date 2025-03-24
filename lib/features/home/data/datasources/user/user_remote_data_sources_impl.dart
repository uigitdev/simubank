import 'package:simubank/simubank.dart';

class UserRemoteDataSourcesImpl extends UserDataSources {
  @override
  Stream<List<UserProfileDetailsModel>?> getUserProfileDetails() async* {
    yield await AppRequestWrapper(GetUserProfileDetailsRequest()).send();
  }
}
