import 'package:simubank/simubank.dart';

abstract class UserDataSources {
  Stream<List<UserProfileDetailsModel>?> getUserProfileDetails();
}