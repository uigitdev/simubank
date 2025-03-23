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
  Map<String, dynamic> get queryParams => _mergedQueryParams();

  @override
  Map<String, dynamic> get headers => _mergedHeaders();

  @override
  HTTPRequestHolderSettings get settings => _request.settings;

  @override
  HTTPRequestHolderDummyResponse? get dummyResponse => _request.dummyResponse;

  /// Merge request queryParams with [sessionState]
  ///
  /// Add [sessionState], [sessionId] to every request.
  Map<String, dynamic> _mergedQueryParams() {
    final queryParams = _request.queryParams;
    queryParams.putIfAbsent('id', () => sessionState.sessionId);
    return queryParams;
  }

  /// Merge request header with [sessionState]
  ///
  /// Add [sessionState], [sessionId] to every request.
  Map<String, dynamic> _mergedHeaders() {
    final headers = _request.headers;
    headers.putIfAbsent('id', () => sessionState.sessionId);
    return headers;
  }
}
