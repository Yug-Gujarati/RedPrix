import 'dart:convert';
import 'package:api/verification_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationRequest {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String countryId;
  final String stateId;
  final String cityId;

  RegistrationRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.countryId,
    required this.stateId,
    required this.cityId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
    };
  }
}

class RegistrationController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final cityIdController = TextEditingController().obs;
  final stateIdController = TextEditingController().obs;
  final countryIdController = TextEditingController().obs;
  var registrationStatus = RxBool(false);
  final Dio dio = Dio();
  bool isHTML = false;

  Future<void> register() async {
    try {
      final RegistrationRequest registrationRequest = RegistrationRequest(
        name: nameController.value.text,
        email: emailController.value.text,
        password: passwordController.value.text,
        confirmPassword: confirmPasswordController.value.text,
        countryId: '101',
        stateId: '12',
        cityId: '1041',
      );

      Options options = Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjQzNTYzNy1jMjJmLTQ2MzktODViZi00ZDViZjRhZmU4NzciLCJqdGkiOiI4Yzg1YTYwOGI4MzRmNDJhYjRmNDIwNGI0NTU4YjJiYzFiZGIyZjQ3MTg1NDVmNTdkY2RlMjY3NjgxZTdjNzRhZWFjZWNmZGI5NTZlNzM4YSIsImlhdCI6MTY1Mjc3NzYwOC40MzI5NTcsIm5iZiI6MTY1Mjc3NzYwOC40MzI5NiwiZXhwIjoxNjg0MzEzNjA4LjEzMzcwMSwic3ViIjoiMzYiLCJzY29wZXMiOltdfQ.ni8pUub6Qv4TgPcP65M1Bw-bjaH7mwFlxDJFbNb2_2xE_0pw1p6lfRTEqclTMUNcD621BSWJm_lm5gefDsCKFLB4O899aZqqlubl0NQoS4ye1CLm626kHCUkma3Mo5qPfv0ZMNDqYveqdvpzkmEoQ-JX6_2cub4SwsDkNDQAnWCF1R17QWSAhfPdYOm4s2IrFAYyBox0YCC4TgGzShQoU_PkSbGH3zphvJPc9adITsAEC5HTUgdsUTp1btoSZ5v1_N_2MtR_9bdJ8Z3VaShGdwvRtHtUKoW2y3bPU4QKFKxn3uZAZd0NOQgXHV1d4bJXpn5ltl7u459-pTEg8U6O4zHdEf9i0RmKcT_KqK6tq1EWptfrUAnxMih7L5sIXlHWEnHMWUw2MNMFyYrLZ5EXkYNwn1U1_Q_QcBZrlddwoLZj3V1Kg7MFgVLx-bELaQN02sKvdpR9j6nd0V0_gyPQ_Sf90Bx_s6B4KSzC7dyh6As6Nm-iuhW5z8jvYh1pxUqMDkmE78iUqG6Ppyfz_0aWhZklaEyFbfZqfuPw4YIoYR1ikgJH2yx47fN_A-t3SX3DlPtRSL7K8t5xihD7eYqAuudBtc4ZUZCI2ecVAfNXZ3CXr65_0Vx6HPeWCLmELPTnT-KTNpYfN87p26IkeIJ7BnB1hHLaWPD1JmgZ4YEMlTk',
        },
      );
      final response = await dio.post(
        'https://uat.redprix.com/api/customers/customers',
        data: registrationRequest.toJson(),
        options: options,
      );
      Map<String, dynamic> responseData = response.data;
      var statusCode = response.data['status_code'];
      if (response.statusCode == 201) {
        String otp = responseData['data']['email_otp'];
        const serviceId = 'service_iygcjye';
        const templateId = 'template_ennec3h';
        const userId = 'vJbps_Z1ze7dmxlDv';
        final response = await dio.post(
          'https://api.emailjs.com/api/v1.0/email/send',
          options: Options(headers: {
            'origin': 'http://localhost',
            'Content-Type': 'application/json',
          }),
          data: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'user_name': nameController.value.text,
              'to_email': emailController.value.text,
              'user_message': otp,
            },
          }),
        );
        Get.to(() => const verificationPage());
        Get.snackbar("send", "OTP Send to your Email-id succefully");
      } else if (response.statusCode == 422) {
        Get.snackbar("Error", "The email has already been taken.",
            backgroundColor: Colors.white);
      } else {
        Get.snackbar("Error", "Server side error",
            backgroundColor: Colors.white);
      }
    } catch (error) {
      if (error is DioError) {
        Get.snackbar("Error", "$error", backgroundColor: Colors.white);
      } else {
        // Handle other errors
        Get.snackbar("Error", "$error", backgroundColor: Colors.white);
      }
    }
  }
}
