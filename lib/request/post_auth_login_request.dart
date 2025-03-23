import 'package:simubank/simubank.dart';

class PostAuthLoginRequest extends HTTPRequestHolder<SessionModel> {
  final String email;
  final String password;

  PostAuthLoginRequest({required this.email, required this.password});

  @override
  String get host => ApiConfig.host;

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.POST;

  @override
  JSONParserType get parserType => JSONParserType.MAP;

  @override
  String get path => 'auth/login';

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  JSONMapParser<SessionModel>? get mapParser => SessionModel.fromJson;

  @override
  Map<String, dynamic> get headers => {'email': email, 'password': password};

  /// Mock auth login response.
  ///
  /// Returns a dummy response for testing purposes.
  /// Simulates a response with a 1-second duration.
  /// If the email is not 'test@example.com', it returns an error response.
  /// Otherwise, it returns a successful response with a mock session ID.
  @override
  HTTPRequestHolderDummyResponse? get dummyResponse =>
      HTTPRequestHolderDummyResponse(
        isDummyResponse: ApiConfig.requestStatus(runtimeType),
        duration: const Duration(seconds: 1),
        dummyErrorResponse: HTTPRequestHolderDummyErrorResponse(
          isDummyErrorResponse: email != 'test@example.com',
          error: {},
        ),
        json: {'sessionId': '1'},
      );
}
