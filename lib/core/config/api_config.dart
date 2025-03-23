import 'package:simubank/simubank.dart';

class ApiConfig {
  ApiConfig._();

  static final String host = 'my-json-server.typicode.com';

  static Map<Type, bool> get _requestStatuses => {
    GetObfuscationKeyRequest: true,
    PostAuthLoginRequest: true,
    GetUserProfileDetailsRequest: false,
  };

  static bool requestStatus(Type type) => _requestStatuses[type] ?? false;
}
