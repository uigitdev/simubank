import 'package:simubank/simubank.dart';

abstract class UserDataSources {
  Future<List<UserProfileDetailsModel>?> getUserProfileDetails();
}