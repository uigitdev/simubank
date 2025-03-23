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
}
