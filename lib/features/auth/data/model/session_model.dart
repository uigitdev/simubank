import 'package:simubank/simubank.dart';

@immutable
class SessionModel extends SessionEntity {
  const SessionModel({required super.sessionId});

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      SessionModel(sessionId: json['sessionId']);
}
