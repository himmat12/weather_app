import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/src/services/clients/base_client_config.dart';
import 'package:weather_app/src/services/services_exceptions.dart';

enum METHOD { get, post, put, delete }

class BaseHttpClient {
  var client = http.Client();
  final _timeOutDuration = 30;

  /// [returnResponse] takes [http.Response response] as positional argument
  /// and return dynamic objects according to the [http.Response] status
  returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        throw decodeResponse(response);
      case 400:
      case 401:
      case 403:
      case 404:
        throw BadRequestException(response);
      case 500:
        throw ServerException(response);
      default:
        throw UnknownException(response);
    }
  }

  /// [decodeResponse] method takes [http.Response]
  /// response(positional argument) and
  /// returns response into deocded [Map<String,dynamic>]
  /// type json object
  decodeResponse(http.Response response) =>
      jsonDecode(utf8.decode(response.bodyBytes));

  /// base Http client requests methods [GET, POST, PUT, DELETE]
  Future<http.Response> requests({
    required METHOD method,
    required String path,
    Map<String, dynamic>? body,
    Map<String, String>? queryParameters,
  }) async {
    dynamic _response;

    switch (method) {

      /// get method
      case METHOD.get:
        _response = await client
            .get(
              BaseClientConfig.parseHttpsUri(
                  path: path,
                  queryParameters: queryParameters ??
                      BaseClientConfig.queryParameters(
                          queryParameters: queryParameters)),
              headers: BaseClientConfig.headers(),
            )
            .timeout(Duration(seconds: _timeOutDuration));
        return _response;

      /// post method
      case METHOD.post:
        _response = await client
            .post(
              BaseClientConfig.parseHttpsUri(
                  path: path,
                  queryParameters: queryParameters ??
                      BaseClientConfig.queryParameters(
                          queryParameters: queryParameters)),
              headers: BaseClientConfig.headers(),
              body: body,
            )
            .timeout(Duration(seconds: _timeOutDuration));
        return _response;

      /// put method
      case METHOD.put:
        _response = await client
            .put(
              BaseClientConfig.parseHttpsUri(
                  path: path,
                  queryParameters: queryParameters ??
                      BaseClientConfig.queryParameters(
                          queryParameters: queryParameters)),
              headers: BaseClientConfig.headers(),
              body: body,
            )
            .timeout(Duration(seconds: _timeOutDuration));
        return _response;

      /// delete method
      case METHOD.delete:
        _response = await client
            .delete(
              BaseClientConfig.parseHttpsUri(
                  path: path,
                  queryParameters: queryParameters ??
                      BaseClientConfig.queryParameters(
                          queryParameters: queryParameters)),
              headers: BaseClientConfig.headers(),
              body: body,
            )
            .timeout(Duration(seconds: _timeOutDuration));
        return _response;
      default:
        return _response;
    }
  }
}
