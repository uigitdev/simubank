import 'package:simubank/simubank.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSources _dataSources;

  UserRepositoryImpl(this._dataSources);

  @override
  Future<List<UserProfileDetailsEntity>?> getUserProfileDetails() async {
    try {
      return await _dataSources.getUserProfileDetails();
    } catch (_) {
      return null;
    }
  }
}
