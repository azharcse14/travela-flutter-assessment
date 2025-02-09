import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../utility/constants/string_manager.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        String message = '';
        try {
          if (error.response != null && error.response!.data != null) {
            var responseData = error.response!.data;
            try {
              responseData = jsonDecode(responseData);
            } catch (e) {
              debugPrint("Failed to parse response data: $e");
            }
            try {
              message = responseData["message"] ?? "";
            } catch (e) {
              debugPrint(
                  "No 'message' key found or invalid data structure: $e");
            }
          }
        } catch (e) {
          debugPrint("An error occurred: $e");
        }
        return Failure(
            code: error.response?.statusCode ?? 0,
            status: error.response?.statusMessage ?? "",
            message: message,
            data: error.response?.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(
            code: HttpStatus.ok, status: ResponseMessage.SUCCESS, message: '');
      case DataSource.NO_CONTENT:
        return Failure(
            code: ResponseCode.NO_CONTENT,
            status: ResponseMessage.NO_CONTENT,
            message: '');
      case DataSource.BAD_REQUEST:
        return Failure(
            code: ResponseCode.BAD_REQUEST,
            status: ResponseMessage.BAD_REQUEST,
            message: '');
      case DataSource.FORBIDDEN:
        return Failure(
            code: ResponseCode.FORBIDDEN,
            status: ResponseMessage.FORBIDDEN,
            message: '');
      case DataSource.UNAUTORISED:
        return Failure(
            code: ResponseCode.UNAUTORISED,
            status: ResponseMessage.UNAUTORISED,
            message: '');
      case DataSource.NOT_FOUND:
        return Failure(
            code: ResponseCode.NOT_FOUND,
            status: ResponseMessage.NOT_FOUND,
            message: '');
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            status: ResponseMessage.INTERNAL_SERVER_ERROR,
            message: '');
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            code: ResponseCode.CONNECT_TIMEOUT,
            status: ResponseMessage.CONNECT_TIMEOUT,
            message: '');
      case DataSource.CANCEL:
        return Failure(
            code: ResponseCode.CANCEL,
            status: ResponseMessage.CANCEL,
            message: '');
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            code: ResponseCode.RECIEVE_TIMEOUT,
            status: ResponseMessage.RECIEVE_TIMEOUT,
            message: '');
      case DataSource.SEND_TIMEOUT:
        return Failure(
            code: ResponseCode.SEND_TIMEOUT,
            status: ResponseMessage.SEND_TIMEOUT,
            message: '');
      case DataSource.CACHE_ERROR:
        return Failure(
            code: ResponseCode.CACHE_ERROR,
            status: ResponseMessage.CACHE_ERROR,
            message: '');
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            status: ResponseMessage.NO_INTERNET_CONNECTION,
            message: '');
      case DataSource.DEFAULT:
        return Failure(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            status: ResponseMessage.NO_INTERNET_CONNECTION,
            message: '');
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
// static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.strBadRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppStrings.strUnauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.strForbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.strInternalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.strNotFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.strTimeoutError;
  static const String CANCEL = AppStrings.strDefaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.strTimeoutError;
  static const String SEND_TIMEOUT = AppStrings.strTimeoutError;
  static const String CACHE_ERROR = AppStrings.strCacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.strNoInternetError;
  static const String DEFAULT = AppStrings.strDefaultError;
}

class ApiInternalStatus {
  static const int SUCCESS = 200;
  static const int FAILURE = 400;
}
