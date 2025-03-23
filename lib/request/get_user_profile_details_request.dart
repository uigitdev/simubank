import 'package:simubank/simubank.dart';

class GetUserProfileDetailsRequest
    extends HTTPRequestHolder<List<UserProfileDetailsModel>> {
  @override
  String get host => ApiConfig.host;

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.GET;

  @override
  JSONParserType get parserType => JSONParserType.LIST;

  @override
  String get path => 'vborbely/SimuBank/users';

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  JSONListParser<List<UserProfileDetailsModel>> get listParser => _parseList;

  @override
  Map<String, dynamic> get queryParams => {'id': sessionState.sessionId};

  @override
  HTTPRequestHolderDummyResponse?
  get dummyResponse => HTTPRequestHolderDummyResponse(
    isDummyResponse: ApiConfig.requestStatus(runtimeType),
    duration: const Duration(seconds: 1),
    json: [
      {
        "id": 1,
        "email": "test@example.com",
        "name": "John Doe",
        "profile_picture":
            "https://images.unsplash.com/photo-1615109398623-88346a601842?w=300",
      },
    ],
  );

  List<UserProfileDetailsModel> _parseList(List<dynamic> jsonList) {
    final list = <UserProfileDetailsModel>[];

    for (var json in jsonList) {
      list.add(UserProfileDetailsModel.fromJson(json));
    }

    return list;
  }
}
