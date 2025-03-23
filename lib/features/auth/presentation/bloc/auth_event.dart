sealed class AuthEvent {
  const AuthEvent();
}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthLogin({required this.email, required this.password});
}

class AuthLogout extends AuthEvent {}