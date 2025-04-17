import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_entity.freezed.dart';

@immutable
@freezed
class SessionEntity with _$SessionEntity {
  @override
  final String sessionId;

  const SessionEntity({required this.sessionId});
}
