import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper{
  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://5a9b-169-150-218-132.ngrok-free.app/api/yla-event/end-user/',
        receiveDataWhenStatusError: true,
       
      ),
    );
  }

  static Future<Response> getData ({
    required String url,
    String lang = 'ar_sy',
  }) async{
    dio?.options.headers = {
      'Accept' : 'application/json',
      'Accept-Language' : '$lang',
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
    'Accept-Language' : 'eng'
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
    //Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
    String lang = 'en',
  }) async {
    dio?.options?.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
      'lang': lang,
    };

    return await dio!.put(
      url,
      data: data,
    );
  }



 }

