import 'package:simubank/simubank.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthNone()) {
    on<AuthLogin>(_onAuthLogin);
  }

  void _onAuthLogin(AuthEvent event, Emitter<AuthState> emit) async {

    emit(AuthInProgress());

    await Future.delayed(const Duration(seconds: 2));


//    emit(AuthAuthenticatedSuccess('ffd'));
    emit(AuthAuthenticationFailed(message: 'valami hiba'));

  }
}
