import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hidoc/utils/helper.dart';

String handleError(dynamic error, dynamic stackTrace) {
  printLogValue("handleError ::: $error");
  printLogValue("handleError stackTrace ::: $stackTrace");
  if (error is Exception) {
    try {
      String errorDescription = "";
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            errorDescription = 'requestCancelled';
            break;
          case DioErrorType.connectionTimeout:
            errorDescription = 'connectionTimeout';
            break;
          case DioErrorType.unknown:
            errorDescription = 'noInternetConnection';
            break;
          case DioErrorType.receiveTimeout:
            errorDescription = 'receiveTimeoutInConnectionWithApiServer';
            break;
          case DioErrorType.badResponse:
            // debugPrint(error.response.toString());
            switch (error.response!.statusCode) {
              case 400:
                errorDescription = getError(error.response)!;
                break;
              case 401:
                printLogValue(
                    "Response code 401: ${error.response.toString()}");
                errorDescription = getError(error.response)!;

                break;
              case 403:
                errorDescription = getError(error.response)!;
                break;
              case 404:
                errorDescription = getError(error.response)!;
                break;
              case 408:
                errorDescription = getError(error.response)!;
                break;
              case 422:
                errorDescription = getError(error.response)!;
                break;
              case 500:
                errorDescription = getError(error.response)!;
                break;
              case 503:
                errorDescription = getError(error.response)!;
                break;
              default:
                errorDescription =
                    "receivedInvalidStatusCode ${error.response!.statusCode}";
            }

            errorDescription = errorDescription;
            break;
          case DioErrorType.sendTimeout:
            errorDescription = 'sendTimeoutInConnectionWithApiServer';
            break;
          case DioErrorType.badCertificate:
            // TODO: Handle this case.
            break;
          case DioErrorType.connectionError:
            // TODO: Handle this case.
            break;
        }
      } else if (error is SocketException) {
        errorDescription = 'noInternetConnection';
      } else {
        errorDescription = 'unexpectedErrorOccurred';
      }
      return errorDescription;
    } on FormatException catch (e) {
      return 'unableToProcessTheData';
    } catch (e) {
      return 'unexpectedErrorOccurred';
    }
  } else {
    if (error.toString().contains('isNotSubtypeOf')) {
      return 'unableToProcessTheData';
    } else {
      return 'unexpectedErrorOccurred';
    }
  }
}

String? getError(Response? response) {
  printLogValue("response.statusMessage ${response!.data}");
  printLogValue(
      "response.statusMessage contains ${(response.data as Map).containsKey('error')}");
  String errorMessage = 'unexpectedErrorOccurred';
  if (response.data != null && response.data is Map) {
    if ((response.data as Map).containsKey('error')) {
      errorMessage = getErrorMsg((response.data)["error"]);
    } else if ((response.data as Map).containsKey('msg')) {
      errorMessage = getErrorMsg((response.data)["msg"]);
    }
    return errorMessage;
  }
  return errorMessage;
}

String getErrorMsg(final errorMessageHeading) {
  if (errorMessageHeading is String) {
    printLogValue("Error is String  $errorMessageHeading");
    return errorMessageHeading;
  } else if (errorMessageHeading is List) {
    printLogValue("Error is List  $errorMessageHeading");
    return errorMessageHeading.join(' , ');
  } else if (errorMessageHeading is Map) {
    printLogValue("Error is Map  $errorMessageHeading");
    List<String> errorList = [];
    errorMessageHeading.forEach((key, value) {
      if (value is List) {
        errorList.add(value[0]);
      } else {
        errorList.add(value);
      }
    });
    printLogValue("Error is Map  ${errorList.join(' , ')}");
    return errorList.join(' , ');
  } else {
    return 'unexpectedErrorOccurred';
  }
}
