import 'package:simubank/simubank.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLoginUseCase _authLoginUseCase;
  final SetSessionUseCase _setSessionUseCase;
  final GetObfuscationKeyUseCase _getObfuscationKeyUseCase;
  final RemoveSessionUseCase _removeSessionUseCase;

  AuthBloc(
    this._authLoginUseCase,
    this._setSessionUseCase,
    this._getObfuscationKeyUseCase,
    this._removeSessionUseCase,
  ) : super(AuthNone()) {
    on<AuthLogin>(_onAuthLogin);
    on<AuthLogout>(_onAuthLogout);
  }

  // Handles user logout
  //
  // Removing the session ID from storage.
  // If successful, clears the session state and dispatches a logout event.
  // Emits either AuthLogoutSuccess or AuthLogoutFailed based on the result.
  void _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    try {
      EventDispatcher().dispatchEvent(AuthLogout());
      final removeSessionIdStorageResult = await _removeSessionUseCase.call(NoData());

      if (removeSessionIdStorageResult) {
        sessionState.clearSessionId();

        emit(AuthLogoutSuccess());
      } else {
        emit(AuthLogoutFailed(message: AppStrings.authErrorSomethingWentWrongLogout));
      }

    } catch(error) {
      emit(AuthLogoutFailed(message: '$error'));
    }
  }

  /// Handles the login process.
  ///
  /// It first shows a loading state, then attempts to authenticate the user
  /// with the provided email and obfuscated password. If authentication is successful,
  /// the session ID is stored and the user is authenticated. If authentication
  /// fails or if the session ID is invalid, an authentication failed state is emitted.
  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());

    try {
      final obfuscationKey = await _getObfuscationKeyUseCase.call(NoData());

      if (obfuscationKey != null) {
        final session = await _authLoginUseCase.call(
          AuthLoginEntity(
            email: event.email,
            password: StringObfuscator(
              obfuscationKey.token,
            ).obfuscate(event.password),
          ),
        );

        if (session != null) {

          final sessionIdStorageResult = await _setSessionUseCase.call(session.sessionId);
          if (sessionIdStorageResult) {
            sessionState.setSessionId(session.sessionId);
            emit(AuthAuthenticatedSuccess(session.sessionId));
          } else {
            emit(AuthAuthenticationFailed(message: AppStrings.authErrorSomethingWentWrong));
          }

        } else {
          emit(AuthAuthenticationFailed(message: AppStrings.authErrorInvalidSessionId));
        }
      } else {
        emit(AuthAuthenticationFailed(message: AppStrings.authErrorUnauthorizedAccess));
      }
    } catch (error) {
      emit(AuthAuthenticationFailed(message: '$error'));
    }
  }
}
