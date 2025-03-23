import 'package:simubank/simubank.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSources _dataSources;

  AuthRepositoryImpl(this._dataSources);

  @override
  Future<ObfuscationKeyEntity?> getObfuscationKey() async {
    try {
      return await _dataSources.getObfuscationKey();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<SessionModel?> postAuthLogin({
    required String email,
    required String password,
  }) async {
    try {
      return await _dataSources.postAuthLogin(email: email, password: password);
    } catch (_) {
      return null;
    }
  }
}
