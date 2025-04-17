import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simubank/simubank.dart';

part 'session_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class SessionModel extends SessionEntity {
  const SessionModel({required super.sessionId});

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}
