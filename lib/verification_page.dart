import 'package:api/component/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'registration_page.dart';

class verificationPage extends StatefulWidget {
  const verificationPage({super.key});

  @override
  State<verificationPage> createState() => _verificationPageState();
}

class _verificationPageState extends State<verificationPage> {
  verificationController controller = Get.put(verificationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text(
          "Verify Email",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 70,
                child: TextFormField(
                  controller: controller.emailController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _formKey.currentState?.validate() == false
                            ? Colors.red
                            : Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _formKey.currentState?.validate() == false
                            ? Colors.red
                            : Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorText: _formKey.currentState?.validate() == false
                        ? 'Please enter email'
                        : null,
                  ),
                ),
              ),

              SizedBox(
                width: 350,
                height: 70,
                child: TextFormField(
                  controller: controller.otpController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter otp';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text('otp'),
                    hintText: 'otp',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _formKey.currentState?.validate() == false
                            ? Colors.red
                            : Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _formKey.currentState?.validate() == false
                            ? Colors.red
                            : Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorText: _formKey.currentState?.validate() == false
                        ? 'Please enter email'
                        : null,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.verify();
                },
                child: Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
