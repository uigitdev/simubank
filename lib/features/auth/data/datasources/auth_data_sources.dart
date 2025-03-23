import 'package:simubank/simubank.dart';

abstract class AuthDataSources {
  Future<ObfuscationKeyEntity?> getObfuscationKey();
}