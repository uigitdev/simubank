import 'package:simubank/simubank.dart';

class AuthDataSourcesImpl extends AuthDataSources {
  @override
  Future<ObfuscationKeyEntity?> getObfuscationKey() async {
    return await AppRequestWrapper(GetObfuscationKeyRequest()).send();
  }

  @override
  Future<SessionModel?> postAuthLogin({
    required String email,
    required String password,
  }) async {
    return await AppRequestWrapper(
      PostAuthLoginRequest(email: email, password: password),
    ).send();
  }
}
