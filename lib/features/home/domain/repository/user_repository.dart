import 'package:simubank/simubank.dart';

abstract class UserRepository {
  Future<List<UserProfileDetailsEntity>?> getUserProfileDetails();
}
