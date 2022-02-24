import 'package:http/http.dart';

class ServiceException implements Exception {
  ServiceException(this.prefix, this.response);
  final Response response;
  final String? prefix;

  @override
  String toString() => "$prefix$response";
}

class UnknownException extends ServiceException {
  UnknownException(Response response) : super("Unknown exception: ", response);
}

class NetworkException extends ServiceException {
  NetworkException(Response response) : super("Network exception: ", response);
}

class ServerException extends ServiceException {
  ServerException(Response response) : super("Server exception: ", response);
}

class BadRequestException extends ServiceException {
  BadRequestException(Response response) : super("Bad Request: ", response);
}

class TimeoutException extends ServiceException {
  TimeoutException(Response response) : super("Timeout: ", response);
}
