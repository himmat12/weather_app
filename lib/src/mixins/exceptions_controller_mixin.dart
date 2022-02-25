import 'dart:async';

import 'package:weather_app/src/services/services_exceptions.dart';
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
      // print('SOCKET EXCEPTION => ${e.response}');
      if (networkExceptionsHandler != null) {
        networkExceptionsHandler(e);
      } else {
        CustomSnackBar.defaultSnackBar(
            "Network : ${ExceptionsConst.socketExceptionStr}");
      }
    } on TimeoutException catch (e) {
      // print("TIMEOUT EXCEPTION => $e");
      if (timeoutExceptionHandler != null) {
        timeoutExceptionHandler(e);
      } else {
        CustomSnackBar.defaultSnackBar(
            "Timeout : ${ExceptionsConst.timeoutExceptionStr}");
      }
    } on BadRequestException catch (e) {
      // print("BAD REQUEST EXCEPTION => $e");

      if (badRequestExceptionHandler != null) {
        badRequestExceptionHandler(e);
      } else {
        CustomSnackBar.defaultSnackBar(
            "Bad Request : ${ExceptionsConst.badRequestExceptionStr}");
      }
    } on ServerException {
      // print("SERVER EXCEPTION => $e");
    } on UnknownException catch (e) {
      if (unknownExceptionHandler != null) {
        unknownExceptionHandler(e);
      } else {
        // print("UNKNOWN EXCEPTION => $e");
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
