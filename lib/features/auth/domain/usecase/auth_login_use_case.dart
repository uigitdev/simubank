import 'package:simubank/simubank.dart';

class AuthLoginUseCase extends AppUseCase<String?, AuthLoginEntity> {

  @override
  Future<String?> call(AuthLoginEntity params) async {
    if(params.email.isEmpty || params.password.isEmpty){
      return Future.error(ErrorHint(AppStrings.authErrorMissingFields));
    }


    await Future.delayed(const Duration(seconds: 2));
    return Future.error(ErrorHint('hello'));

  }
}