import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';
//import 'package:http/http.dart' as http;

class LoginPageController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  var loginStatus = RxBool(false);
  final Dio dio = Dio();

  Future<void> saveTokenToPrefs(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> login() async {
    try {
      final response = await dio.post(
        'https://uat.redprix.com/api/login',
        data: {
          'email': emailController.value.text,
          'password': passwordController.value.text,
        },
      );
      Map<String, dynamic> responseData = response.data;

      String statusCode = responseData['status_code'];
      if (response.statusCode == 200) {
        String token = responseData['data']['authorization'];
        //print('Token: $token');
        await saveTokenToPrefs(token);
        Get.to(() => HomePage(
              token: token,
            ));
      } else if (response.statusCode == 422) {
        loginStatus.value = false;
        String errorMessage =
            response.data['message'] ?? 'Something went wrong';
        Get.snackbar("Error", errorMessage,
            backgroundColor: Colors.white, duration: const Duration(seconds: 4));
      }
    } catch (e) {
      loginStatus.value = false;
      Get.snackbar("Error", '$e',
          backgroundColor: Colors.white, duration: const Duration(seconds: 4));
    }
  }
}
