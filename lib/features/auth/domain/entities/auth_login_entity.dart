import 'package:flutter/cupertino.dart';

@immutable
class AuthLoginEntity {
  final String email;
  final String password;

  const AuthLoginEntity({required this.email, required this.password});
}
