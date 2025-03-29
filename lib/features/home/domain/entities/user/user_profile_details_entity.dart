import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_details_entity.freezed.dart';

@immutable
@freezed
class UserProfileDetailsEntity with _$UserProfileDetailsEntity {
  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String? profilePicture;

  const UserProfileDetailsEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.profilePicture,
  });
}
