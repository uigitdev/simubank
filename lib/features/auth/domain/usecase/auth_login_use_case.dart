import 'package:simubank/simubank.dart';

class AuthLoginUseCase extends AppUseCase<SessionEntity?, AuthLoginEntity> {
  final AuthRepository _repository;

  AuthLoginUseCase(this._repository);

  @override
  Future<SessionEntity?> call(AuthLoginEntity login) async {
    try {
      if (login.email.isEmpty || login.password.isEmpty) {
        return Future.error(ErrorHint(AppStrings.authErrorMissingFields));
      }
      final session = await _repository.postAuthLogin(
        email: login.email,
        password: login.password,
      );

      if (session == null) {
        return Future.error(ErrorHint(AppStrings.authErrorLoginFailed));
      }

      return session;
    } catch (_) {
      return null;
    }
  }
}
