import 'package:simubank/simubank.dart';

abstract class AuthRepository {
  Future<ObfuscationKeyEntity?> getObfuscationKey();
  Future<SessionEntity?> postAuthLogin({required String email, required String password});
}
