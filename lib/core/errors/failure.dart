import 'package:the_rich_and_morty/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class Failure implements Exception {
  final ErrorModel errModel;

  Failure({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw Failure(errModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
