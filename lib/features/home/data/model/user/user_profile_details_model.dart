import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simubank/simubank.dart';

part 'user_profile_details_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class UserProfileDetailsModel extends UserProfileDetailsEntity {
  const UserProfileDetailsModel({
    required super.id,
    required super.email,
    required super.name,
    required super.profilePicture,
  });

  @override
  @JsonKey(name: 'profile_picture')
  String? get profilePicture => super.profilePicture;

  factory UserProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDetailsModelToJson(this);
}
