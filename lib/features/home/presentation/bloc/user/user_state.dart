import 'package:simubank/simubank.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserNone extends UserState {}

class UserGetProfileDetailsSuccess extends UserState {
  final UserProfileDetailsEntity profile;

  const UserGetProfileDetailsSuccess(this.profile);

  @override
  List<Object> get props => [profile.id];
}

class UserGetProfileDetailsFailed extends UserState {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  const UserGetProfileDetailsFailed({
    required this.message,
    this.error,
    this.stackTrace,
  });
}
