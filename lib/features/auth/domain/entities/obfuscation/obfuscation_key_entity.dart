import 'package:freezed_annotation/freezed_annotation.dart';

part 'obfuscation_key_entity.freezed.dart';

@immutable
@freezed
class ObfuscationKeyEntity with _$ObfuscationKeyEntity {
  @override
  final String token;

  const ObfuscationKeyEntity(this.token);
}
