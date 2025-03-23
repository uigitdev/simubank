import 'package:simubank/simubank.dart';

class AuthDataSourcesImpl extends AuthDataSources {
  @override
  Future<ObfuscationKeyEntity?> getObfuscationKey() async {
    return await AppRequestWrapper(GetObfuscationKeyRequest()).send();
  }
}
