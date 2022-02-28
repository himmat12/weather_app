import 'dart:async';
import 'dart:convert';

import 'package:weather_app/src/exceptions/services_exceptions.dart';
import 'package:weather_app/src/views/global_components/custom_snackbar.dart';

mixin ExceptionsControllerMixin {
  Future<void> exceptionsController(
    Function() func, {
    Function? networkExceptionsHandler,
    Function? timeoutExceptionHandler,
    Function? badRequestExceptionHandler,
    Function? serverExceptionsHandler,
    Function? unknownExceptionHandler,
  }) async {
    try {
      await func();
    } on NetworkException catch (e) {
      if (networkExceptionsHandler != null) {
        networkExceptionsHandler(e.response);
        CustomSnackBar.defaultSnackBar(
            "Network : ${jsonDecode(e.response.body)['error']['message']}");
      }
    } on TimeoutException catch (e) {
      if (timeoutExceptionHandler != null) {
        timeoutExceptionHandler(e.response);
        CustomSnackBar.defaultSnackBar(
            "Timeout : ${ExceptionsConst.timeoutExceptionStr}");
      }
    } on BadRequestException catch (e) {
      if (badRequestExceptionHandler != null) {
        badRequestExceptionHandler(e.response);
        CustomSnackBar.defaultSnackBar(
            "Bad Request : ${jsonDecode(e.response.body)['error']['message']}");
      }
    } on UnknownException catch (e) {
      if (unknownExceptionHandler != null) {
        unknownExceptionHandler(e.response);
        CustomSnackBar.defaultSnackBar(
            "Exception : ${jsonDecode(e.response.body)['error']['message']}");
      }
    } catch (e) {
      // print("Base Exception $e");
    }
  }
}

/// exceptions const strings
class ExceptionsConst {
  static const socketExceptionStr =
      "socket exception no internet connection ...";
  static const timeoutExceptionStr = "service not responding in time ...";
  static const serverExceptionStr =
      "error occured while communicating with server ...";
  static const fetchDataExceptionStr =
      "error occured while fetching data from service ...";
  static const badRequestExceptionStr = "bad request exception ...";
}
