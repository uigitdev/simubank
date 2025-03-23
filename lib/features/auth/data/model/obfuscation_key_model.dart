import 'package:simubank/simubank.dart';

class ObfuscationKeyModel extends ObfuscationKeyEntity {
  ObfuscationKeyModel(super.token);

  factory ObfuscationKeyModel.fromJson(Map<String, dynamic> json) =>
      ObfuscationKeyModel(json['token']);
}
