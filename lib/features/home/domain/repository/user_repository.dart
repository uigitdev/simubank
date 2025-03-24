import 'package:simubank/simubank.dart';

abstract class UserRepository {
  Stream<List<UserProfileDetailsEntity>?> getUserProfileDetails();
  Future<bool> deleteUserProfileDetails();
}
