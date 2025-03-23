import 'package:simubank/simubank.dart';

class SessionModel extends SessionEntity {
  SessionModel({required super.sessionId});

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      SessionModel(sessionId: json['sessionId']);
}
