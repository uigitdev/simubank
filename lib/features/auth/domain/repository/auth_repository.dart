import 'package:simubank/simubank.dart';

abstract class AuthRepository {
  Future<ObfuscationKeyEntity?> getObfuscationKey();
}
