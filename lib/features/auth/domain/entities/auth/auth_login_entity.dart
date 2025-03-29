import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_login_entity.freezed.dart';

@immutable
@freezed
class AuthLoginEntity with _$AuthLoginEntity {
  @override
  final String email;
  @override
  final String password;

  const AuthLoginEntity({required this.email, required this.password});
}
