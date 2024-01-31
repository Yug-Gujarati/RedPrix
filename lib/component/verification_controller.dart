import 'package:api/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class verificationController extends GetxController{
 final emailController = TextEditingController().obs;
 final otpController = TextEditingController().obs;

 var otpStatus = false;
 final Dio dio = Dio();

  Options options = Options(
        headers: {
          'Content-Type': 'application/json',
        },
      );
      
  Future<void> verify() async{
    try{
      final response = await dio.post('https://uat.redprix.com/api/verify-email',
      data:{
        'email': emailController.value.text,
        'email_otp': otpController.value.text,
      },
      options: options,
      );
      Map<String, dynamic> responseData = response.data;
      print(responseData);
      if(response.statusCode == 200){
        Get.to(()=>const LoginPage());
        Get.snackbar("message", responseData['data']['message'],backgroundColor: Colors.white,duration: const Duration(seconds: 4));
      }
      else if(response.statusCode == 422){
        Get.snackbar("message", responseData['data']['message'], backgroundColor: Colors.white,duration: const Duration(seconds: 4));
      }
    }catch(e){
      Get.snackbar("error", "OTP or Email id wrong", backgroundColor: Colors.white,duration: const Duration(seconds: 4));
    }
  }
}