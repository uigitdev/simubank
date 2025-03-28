import 'package:flutter/cupertino.dart';

@immutable
class UserProfileDetailsEntity {
  final int id;
  final String email;
  final String name;
  final String? profilePicture;

  const UserProfileDetailsEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.profilePicture,
  });
}
