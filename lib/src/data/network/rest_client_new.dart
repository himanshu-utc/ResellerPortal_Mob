import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../resources/strings.dart';
import 'api.dart';
import 'api_response.dart';

class RestClientNew {
  Dio? _dio = null;

  RestClientNew() {
    BaseOptions options = new BaseOptions(
      baseUrl: Api.demoApi,
    );

    _dio = Dio(options);
    _dio!.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<ApiResponse> get(BuildContext context, apiName,
      {body, Map<String, dynamic>? header, Options? option}) async {
    Map<String, dynamic> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "get");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio!.request(apiName, data: body, options: option);

      return ApiResponse.fromJson(jsonDecode(response.data));
    } catch (error) {
      if (error==400) {
        return ApiResponse(
            status: "0",
            //message: StringHelper.server_error_please_try_again_later,
            object: null,
            token: "");
      }

      return ApiResponse(
          status: "0",
          //message: StringHelper.server_error_please_try_again_later,
          object: null,
          token: "");
    }
  }

  Future<dynamic> getNormal(BuildContext context, apiName,
      {body, Map<String, dynamic>? header, Options? option}) async {
    Map<String, dynamic> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "get");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio!.request(apiName, data: body, options: option);

      return response.data;
    } catch (error) {
      if (error == 400) {
        return ApiResponse(
            status: "0",
            //message: StringHelper.server_error_please_try_again_later,
            object: null,
            token: "");
      }

      return ApiResponse(
          status: "0",
          //message: StringHelper.server_error_please_try_again_later,
          object: null,
          token: "");
    }
  }

  Future<ApiResponse> post(
    BuildContext context,
    apiName, {
    body,
    Map<String, dynamic>? header,
    Options? option,
  }) async {
    Map<String, dynamic> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "post");
      option.headers = headers;
    }
    Response response;
    try {
      response = await _dio!.request(
        apiName,
        data: body,
        options: option,
        onSendProgress: (int sent, int total) {
          // print("Sent  = " +
          //     sent.toString() +
          //     " Left = " +
          //     (total - sent).toString());
        },
      );

      return ApiResponse.fromJson(jsonDecode(jsonEncode(response.data)));
    } catch (e) {
      // print("Catch 1 error");
      //print(e);
      var error = e as DioError;

      //    print(error.response.statusCode);
      if (error.response!.statusCode == 404) {
        return ApiResponse(
            status: "0",
            message: error.response!.data.toString(),
            object: null,
            token: "");
      }
      if (error.response!.statusCode == 401) {
        return ApiResponse(
            status: "0",
            message: error.response!.data["msg"].toString(),
            object: null,
            token: "");
      }
      return ApiResponse(
          status: "0",
          //message: StringHelper.server_error_please_try_again_later,
          object: null,
          token: "");
    }
  }

  Future<dynamic> postNormal(
    BuildContext context,
    apiName, {
    body,
    Map<String, dynamic>? header,
    Options? option,
  }) async {
    Map<String, dynamic> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "post");
      option.headers = headers;
    }
    Response response;
    try {
      response = await _dio!.request(
        apiName,
        data: body,
        options: option,
        onSendProgress: (int sent, int total) {
          // print("Sent  = " +
          //     sent.toString() +
          //     " Left = " +
          //     (total - sent).toString());
        },
      );

      return response.data;
    } catch (e) {
      /* print("Catch 1 error");
      print(e);*/
      var error = e as DioError;
      if (error.response!.statusCode == 404) {
        return ApiResponse(
            status: "0",
            message: error.response!.data.toString(),
            object: null,
            token: "");
      }
      return ApiResponse(
          status: "0",
          //message: StringHelper.server_error_please_try_again_later,
          object: null,
          token: "");
    }
  }

  Future<ApiResponse> put(BuildContext context, apiName,
      {body, Map<String, dynamic>? header, Options? option}) async {
    Map<String, dynamic> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "put");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio!.request(apiName, data: body, options: option);

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      var error = e as DioError;
      if (error.response!.statusCode == 401) {
        // doLogout(context);
        //   AppNavigator.launchAuthFailedPage(context);
      }
      return ApiResponse(
          status: "0",
          //message: StringHelper.server_error_please_try_again_later,
          object: null,
          token: "");
    }
  }

// void doLogout(BuildContext context) async {
//   SharePreferencesHelper.getInstant()
//       .setBool(SharePreferencesHelper.Is_Login, false);
//   SharePreferencesHelper.getInstant().clearPreference();
//   AppNavigator.launchLoginPage(context);
// }
}

final RestClientNew restClientNew = RestClientNew();
