import 'dart:convert';
import 'package:books/helpers/loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Api {
  static execute({url, data}) async {
    try {
      var result;

      Dio dio = Dio();

      result = await dio.get(url);
      print(result);
      print('object');
      var response = jsonDecode(result.toString());

      return response;
    } catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar('API ERROR!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
