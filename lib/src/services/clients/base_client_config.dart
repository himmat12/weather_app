import 'dart:io';

class BaseClientConfig {
  /// base client authority
  static const String _apiKey = "6214dbb9ba3d41aba2c92041222402";

  /// base client authority
  static const String _baseClientAuthority = "api.weatherapi.com";

  /// unincoded path
  static const String _unencodedPath = "/v1/current.json?key=$_apiKey";

  /// query parameters
  static const Map<String, String> _queryParameters = {};

  /// query parameters
  static Map<String, String> queryParameters(
      {Map<String, String>? queryParameters}) {
    _queryParameters.addAll(queryParameters ?? {});
    return _queryParameters;
  }

  /// headers
  static Map<String, String> headers() {
    Map<String, String> _headers = {
      HttpHeaders.acceptHeader: "application/json"
    };
    return _headers;
  }

  /// parse https uri
  static Uri parseHttpsUri({Map<String, String>? queryParameters}) =>
      Uri.https(_baseClientAuthority, _unencodedPath, queryParameters);
}
