import 'package:simubank/simubank.dart';

sealed class UserState {
  const UserState();
}

class UserNone extends UserState {}

class UserGetProfileDetailsSuccess extends UserState {
  final UserProfileDetailsEntity profile;

  UserGetProfileDetailsSuccess(this.profile);
}

class UserGetProfileDetailsFailed extends UserState {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  UserGetProfileDetailsFailed({
    required this.message,
    this.error,
    this.stackTrace,
  });
}
