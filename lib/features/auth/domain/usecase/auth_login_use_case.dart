import 'package:simubank/simubank.dart';

class AuthLoginUseCase extends AppUseCase<String?, AuthLoginEntity> {

  @override
  Future<String?> call(AuthLoginEntity login) async {
    if(login.email.isEmpty || login.password.isEmpty){
      return Future.error(ErrorHint(AppStrings.authErrorMissingFields));
    }

    print('obf password: ${login.password}');


    await Future.delayed(const Duration(seconds: 2));
    return Future.error(ErrorHint('hello'));

  }
}