import 'package:simubank/simubank.dart';

class GetObfuscationKeyRequest extends HTTPRequestHolder<ObfuscationKeyModel> {
  @override
  String get host => ApiConfig.host;

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.GET;

  @override
  JSONParserType get parserType => JSONParserType.MAP;

  @override
  String get path => 'obfuscation-token';

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  JSONMapParser<ObfuscationKeyModel>? get mapParser =>
      ObfuscationKeyModel.fromJson;

  @override
  HTTPRequestHolderDummyResponse? get dummyResponse =>
      HTTPRequestHolderDummyResponse(
        isDummyResponse: ApiConfig.requestStatus(runtimeType),
        duration: const Duration(milliseconds: 400),
        json: {'token': const Uuid().v4()},
      );
}
