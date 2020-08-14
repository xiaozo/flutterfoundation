import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation.dart';

class NetUtils {
  static Dio _dio;
  static void init(String baseUrl) async {
    _dio = Dio(BaseOptions(baseUrl: '$baseUrl', followRedirects: false))
      ..interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  static Future<Response> _post(
      String path,
      {
        Map<String, dynamic> params,
      }
      ) async {
    try {

      return await _dio.post(path, queryParameters: params);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {

    }
  }

  static Future<Response> _encryptpost (
      String path,
      {
        Map<String, dynamic> params,
        Map<String, dynamic> expandParams,
      }
      ) async {
    //anzhuo
    Map<String, dynamic> fparams = await Flutterfoundation.encodingJsonNetworkDataWithFunction(path,"5796454","B7302E121B6F4864226D8387A102A489","E6876647D98615ED662BEF60A26A524D","1",params,expandParams);

//    Map<String, dynamic> fparams = await Flutterfoundation.encodingJsonNetworkDataWithFunction(path,"4538567","B7302E121B6F4864226D8387A102A489","E6876647D98615ED662BEF60A26A524D","1",params,expandParams);
    return _post("",params: fparams);
  }

  static void login(Map<String, String> params) async{
    Response response = await _encryptpost("user/userLogin",params: params);
    print(response);
  }

}