import 'package:simubank/simubank.dart';

@immutable
class UserProfileDetailsModel extends UserProfileDetailsEntity {
  const UserProfileDetailsModel({
    required super.id,
    required super.email,
    required super.name,
    required super.profilePicture,
  });

  factory UserProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserProfileDetailsModel(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        profilePicture: json['profile_picture'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'profile_picture': profilePicture,
  };
}
