import 'package:json_annotation/json_annotation.dart';
import 'package:simubank/simubank.dart';

part 'obfuscation_key_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ObfuscationKeyModel extends ObfuscationKeyEntity {
  const ObfuscationKeyModel(super.token);

  factory ObfuscationKeyModel.fromJson(Map<String, dynamic> json) =>
      _$ObfuscationKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ObfuscationKeyModelToJson(this);
}
