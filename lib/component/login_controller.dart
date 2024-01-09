import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';
//import 'package:http/http.dart' as http;

class LoginPageController extends GetxController{
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  var loginStatus = RxBool(false);
  final Dio dio = Dio();

  Future<void> saveTokenToPrefs(String token) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('auth_token', token);
 }
  
  Future<void> login() async{
    try{
       final response = await dio.post('https://uat.redprix.com/api/login',
       data: {
         'email': emailController.value.text,
         'password': passwordController.value.text,
       },
      );
      Map<String, dynamic> responseData = response.data;
     // var da = jsonDecode(response.data);
      print(response.statusCode);
      //dprint(responseData);
      if(response.statusCode == 200){
        String token = responseData['data']['authorization'];
        print('Token: $token');
        await saveTokenToPrefs(token);
        Get.to(() => HomePage(token: token,));
      }else{
        loginStatus.value = false;
        Get.snackbar("Error", "Wrong email or password", backgroundColor: Colors.white);
      }
    }catch(e){
        loginStatus.value = false;
        Get.snackbar("Error", "Wrong email or password", backgroundColor: Colors.white);
    }
  }
}