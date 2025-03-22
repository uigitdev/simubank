import 'package:simubank/simubank.dart';

class AppRequestWrapper<T> extends HTTPRequestHolder<T> {
  final HTTPRequestHolder<T> _request;

  AppRequestWrapper(this._request);

  @override
  HTTPRequestMethod get method => _request.method;

  @override
  HTTPRequestProtocol get protocol => _request.protocol;

  @override
  String get host => _request.host;

  @override
  String get path => _request.path;

  @override
  JSONParserType get parserType => _request.parserType;

  @override
  JSONMapParser<T>? get mapParser => _request.mapParser;

  @override
  JSONListParser<T>? get listParser => _request.listParser;

  @override
  dynamic get requestBody => _request.requestBody;

  @override
  Map<String, dynamic> get queryParams => _request.queryParams;

  @override
  Map<String, dynamic> get headers => _request.headers;

  @override
  HTTPRequestHolderSettings get settings => _request.settings;

  @override
  HTTPRequestHolderDummyResponse? get dummyResponse => _request.dummyResponse;
}
