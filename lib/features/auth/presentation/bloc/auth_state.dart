import 'package:simubank/simubank.dart';

sealed class AuthState {
  const AuthState();
}

class AuthNone extends AuthState {}

class AuthInProgress extends AuthState {}

class AuthAuthenticatedSuccess extends AuthState {
  final String sessionId;

  const AuthAuthenticatedSuccess(this.sessionId);
}

class AuthAuthenticationFailed extends AuthState {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  const AuthAuthenticationFailed({
    required this.message,
    this.error,
    this.stackTrace,
  });
}

class AuthLogoutSuccess extends AuthState {}

class AuthLogoutFailed extends AuthState implements ErrorState {
  @override
  final String message;
  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  AuthLogoutFailed({required this.message, this.error, this.stackTrace});
}
