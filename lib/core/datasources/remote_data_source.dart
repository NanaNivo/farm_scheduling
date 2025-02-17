//import 'package:vendor/features/user_management/domain/repositories/user_repository.dart';
import 'dart:io';

import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/datasources/api_call_params.dart';
import 'package:farm_scheduling/core/datasources/refreshable.dart';
import 'package:farm_scheduling/core/error/connection/unknown_error.dart';
import 'package:farm_scheduling/core/error/http/unauthorized_error.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api/api_helper.dart';
import '../enums/api/HttpMethod.dart';
import '../error/base_error.dart';
import '../error/custom_error.dart';
import '../factories/ModelFactory.dart';
import '../response/api_response.dart';
import '../services/session_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

abstract class RemoteDataSource with RefreshableRemote {
  Future<Either<BaseError, Data>> request<Data, Response extends ApiResponse>(
    ApiCallParams<Response> params,
  ) async {
    ModelFactory.getInstance().registerModel(params.responseStr, params.mapper);

    final Map<String, String> headers = params.headers?? {};
    print('token: ${await locator<SessionManager>().authToken}');
    if (params.token != null && params.token!.isNotEmpty) {
      headers.putIfAbsent(SessionManager.authorizeToken, () => 'Bearer ${params.token}');
    }
   // PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //  print('packageInfo.version: ${packageInfo.version}, ${Platform.operatingSystem}');

    headers.putIfAbsent('Content-Type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
   // headers.putIfAbsent('Accept', () => '*/*');
   //  headers.putIfAbsent('platformVersion', () => packageInfo.version);
   //
   //
   // headers.putIfAbsent('platformActive', () => Platform.operatingSystem);
   // headers.putIfAbsent('Connection', () => 'keep-alive');

    //  headers['content-Type'] = 'application/json';
    //  headers.putIfAbsent(LANGUAGE, () => acceptLang);

    print('data: ${params.data}');
    final response = await ApiHelper().sendRequest<Response>(
        method: params.method,
        url: params.url,
        data: params.data,
        headers: headers,

        cancelToken: params.cancelToken);

    print('123 123 Response: $response');

    if (response.isLeft()) {
      BaseError error = (response as Left<BaseError, Response>).value;
      return Left(error);
    } else if (response.isRight()) {
      final resValue = (response as Right<BaseError, Response>).value;
      print('has error : ${resValue.hasError}${resValue.result}${(response as Right<BaseError, Response>).value}');
      if (resValue.hasError) return Left(CustomError(message: resValue.msg));
      return Right(resValue.result);
    }
    return left(UnknownError());
  }
}

/*
*  if (response.statusCode == 200) {
        final token = response.data['content']['token'];
        final refreshToken = response.data['content']['refresh_token'];
        tokens.addAll([token, refreshToken]);
      }
      return tokens;
* */
