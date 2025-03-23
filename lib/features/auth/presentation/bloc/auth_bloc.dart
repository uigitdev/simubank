import 'package:simubank/simubank.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLoginUseCase _authLoginUseCase;
  final SetSessionUseCase _setSessionUseCase;

  AuthBloc(this._authLoginUseCase, this._setSessionUseCase)
    : super(AuthNone()) {
    on<AuthLogin>(_onAuthLogin);
  }

  /// Handles the login process.
  ///
  /// It first shows a loading state, then attempts to authenticate the user
  /// with the provided email and password. If authentication is successful,
  /// the session ID is stored and the user is authenticated. If authentication
  /// fails or if the session ID is invalid, an authentication failed state is emitted.
  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());

    try {
      final sessionId = await _authLoginUseCase.call(
        AuthLoginEntity(email: event.email, password: event.password),
      );

      if (sessionId != null && sessionId.isNotEmpty) {
        await _setSessionUseCase.call(sessionId);
        sessionState.setSessionId(sessionId);
        emit(AuthAuthenticatedSuccess(sessionId));
      } else {
        emit(AuthAuthenticationFailed(message: AppStrings.authErrorInvalidSessionId));
      }
    } catch (error) {
      emit(AuthAuthenticationFailed(message: '$error'));
    }
  }
}
