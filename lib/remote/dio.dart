import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:ylaevent/shared/components/constans.dart';

class DioHelper{
  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.209.139:8000/api/yla-event/',
        receiveDataWhenStatusError: true,
       
      ),
    );

    dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  static Future<Response> getData ({
    required String url,
  }) async{
    dio?.options.headers = {
      'Accept' : 'application/json',
      'Accept-Language' : 'eng',
      'Authorization': 'Bearer $token',
    };
    return await dio!.get( 
      url ,
     );
  }

static Future<Response> postData({
  required String url,
  required dynamic data,

}) async {
  dio?.options.headers = {
    'Accept' : 'application/json',
    'Accept-Language' : 'eng',
    'Authorization': 'Bearer $token',
  };

  return  dio!.post(
    url,
    data: data,
  );
}

  static Future<Response> downloadFile({
    required String url,
    required saveFilePath,
  }) async {
    dio?.options.headers = {
      'Accept' : 'application/json',
      'Accept-Language' : 'eng'
    };
    return dio!.download(
      url,
      saveFilePath,

    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio?.options?.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'lang': 'eng',
    };

    return await dio!.put(
      url,
      data: data,
    );
  }



 }

