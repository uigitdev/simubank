import 'package:simubank/simubank.dart';

abstract class UserDataSources {
  Stream<List<UserProfileDetailsModel>?> getUserProfileDetails();
  Future<bool> cacheUserProfileDetails(List<UserProfileDetailsModel> profileDetails){
    return Future.value(false);
  }
  Future<bool> removeCachedUserProfileDetails() {
    return Future.value(false);
  }
}