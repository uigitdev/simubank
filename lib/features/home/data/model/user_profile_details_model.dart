import 'package:simubank/simubank.dart';

class UserProfileDetailsModel extends UserProfileDetailsEntity {
  UserProfileDetailsModel({
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
}
