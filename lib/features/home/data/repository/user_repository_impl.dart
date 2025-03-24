import 'package:simubank/simubank.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSources _dataSources;

  UserRepositoryImpl(this._dataSources);

  @override
  Stream<List<UserProfileDetailsEntity>?> getUserProfileDetails() async* {
    try {
      yield* _dataSources.getUserProfileDetails();
    } catch (_) {
      yield null;
    }
  }
}
