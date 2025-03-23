import 'package:simubank/simubank.dart';

abstract class AuthRepository {
  Future<ObfuscationKeyEntity?> getObfuscationKey();
  Future<SessionModel?> postAuthLogin({required String email, required String password});
}
