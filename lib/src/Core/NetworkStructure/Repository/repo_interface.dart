import 'dart:io';
import 'package:flutter_base/src/Core/NetworkStructure/Constants/exception_constants.dart';
import 'package:flutter_base/src/Core/NetworkStructure/DataSource/service_interface.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Exceptions/failure.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Params/params.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Resources/Errors/error_model.dart';
import 'package:flutter_base/src/Core/Utils/general_utils.dart';

enum ResponseType {
  withData,
  withoutData,
}

enum HasKeys {
  noKeys,
  hasKeys,
}

abstract class RepoInterface<T> {
  /// return Your [Service] Class Instance In This Getter
  ServicesInterface get serviceInstance;

  ResponseType get responseType => ResponseType.withData;

  HasKeys get hasKeys => HasKeys.hasKeys;

  T Function(dynamic data) get onParse;

  Future<DataState<T>>? call({
    Params? params,
    QueryParams? queryParams,
  }) async {
    try {
      final httpResponse = await serviceInstance.applyService(
        params: params,
      );
      final checkResponse = ((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted));

      if (checkResponse) {
        if (hasKeys == HasKeys.hasKeys) {
          if (responseType == ResponseType.withoutData) {
            return DataSuccess<T>(onParse(httpResponse.data),
                message: httpResponse.data['message']);
          }
          if (httpResponse.data['data'] != null) {
            try {
              T data = onParse(httpResponse.data['data']);
              return DataSuccess<T>(data,
                  message: httpResponse.data['message']);
            } catch (e) {
              printDM('on Catch error from Repo =>  $e');
              return DataFailed(
                ErrorModel(
                  title: httpResponse.data['message'] ?? '',
                  type: ErrorType.dirtyData,
                ),
              );
            }
          } else {
            return DataFailed(
              ErrorModel(
                title: httpResponse.data['message'] ?? '',
                type: ErrorType.dataEmpty,
              ),
            );
          }
        } else {
          printDM("sucess without keys");
          return DataSuccess<T>(onParse(httpResponse.data),
              message: "Done Successfully");
        }
      }
      return DataFailed(
        ErrorModel(
          title: httpResponse.data['message'] ?? '',
          type: ErrorType.serverSide,
        ),
      );
    } on BadRequestException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.badRequestException,
          type: ErrorType.serverSide,
        ),
      );
    } on ForbiddenException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.forbiddenException,
          type: ErrorType.serverSide,
        ),
      );
    } on NetworkDisconnectException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.networkDisconnectException,
          type: ErrorType.networkConnection,
        ),
      );
    } on UnAuthorizedException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.unAuthorizedException,
          type: ErrorType.serverSide,
        ),
      );
    } on NotFoundException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.notFoundException,
          type: ErrorType.serverSide,
        ),
      );
    } on MethodNotAllowedException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.methodNotAllowedException,
          type: ErrorType.serverSide,
        ),
      );
    } on NotAcceptableException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.notAcceptableException,
          type: ErrorType.serverSide,
        ),
      );
    } on RequestTimeoutException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.requestTimeoutException,
          type: ErrorType.serverSide,
        ),
      );
    } on ConflictException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.conflictException,
          type: ErrorType.serverSide,
        ),
      );
    } on InternalServerException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.internalServerException,
          type: ErrorType.serverSide,
        ),
      );
    } on NotImplementedException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.notImplementedException,
          type: ErrorType.serverSide,
        ),
      );
    } on BadGatewayException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.badGatewayException,
          type: ErrorType.serverSide,
        ),
      );
    } on ServiceUnavailableException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.serviceUnavailableException,
          type: ErrorType.serverSide,
        ),
      );
    } on GatewayTimeoutException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.gatewayTimeoutException,
          type: ErrorType.serverSide,
        ),
      );
    } on UnKnownException {
      return DataFailed(
        ErrorModel(
          title: ExceptionConstants.instance.unKnownException,
          type: ErrorType.unKnown,
        ),
      );
    }
  }
}
