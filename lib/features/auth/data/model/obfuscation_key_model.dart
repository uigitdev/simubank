import 'package:simubank/simubank.dart';

@immutable
class ObfuscationKeyModel extends ObfuscationKeyEntity {
  const ObfuscationKeyModel(super.token);

  factory ObfuscationKeyModel.fromJson(Map<String, dynamic> json) =>
      ObfuscationKeyModel(json['token']);
}
