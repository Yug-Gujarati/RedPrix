import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'component/custom_scaffold.dart';
import 'component/registration_controller.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegistrationController controller = Get.put(RegistrationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Dio _dio = Dio();
  String? _dropdownValue;
  String? _dropdownValue1;
  String? _dropdownValue2;

  void callBack(String? selected) {
    if (selected is String) {
      setState(() {
        _dropdownValue = selected;
      });
    }
  }

  void callBack1(String? selected1) {
    if (selected1 is String) {
      setState(() {
        _dropdownValue1 = selected1;
      });
    }
  }

  void callBack2(String? selected2) {
    if (selected2 is String) {
      setState(() {
        _dropdownValue2 = selected2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              height: 400,
              padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full Name';
                          }
                          return null;
                        },
                        controller: controller.nameController.value,
                        decoration: InputDecoration(
                          label: const Text('Full Name'),
                          hintText: 'Full Name',
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
                              ? 'Please enter name'
                              : null,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        controller: controller.emailController.value,
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                child: Text("100"),
                                value: "100",
                              ),
                              DropdownMenuItem(
                                child: Text("101"),
                                value: "101",
                              ),
                              DropdownMenuItem(
                                child: Text("102"),
                                value: "102",
                              ),
                              DropdownMenuItem(
                                child: Text("103"),
                                value: "103",
                              ),
                            ],
                            value: _dropdownValue,
                            onChanged: callBack,
                            hint: Text("Country"),
                          ),
                          DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                value: "10",
                                child: Text("10"),
                              ),
                              DropdownMenuItem(
                                value: "11",
                                child: Text("11"),
                              ),
                              DropdownMenuItem(
                                value: "12",
                                child: Text("12"),
                              ),
                              DropdownMenuItem(
                                value: "13",
                                child: Text("13"),
                              ),
                            ],
                            value: _dropdownValue1,
                            onChanged: callBack1,
                            hint: Text("State"),
                          ),
                          DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                child: Text("1040"),
                                value: "1040",
                              ),
                              DropdownMenuItem(
                                child: Text("1041"),
                                value: "1041",
                              ),
                              DropdownMenuItem(
                                child: Text("1042"),
                                value: "1042",
                              ),
                              DropdownMenuItem(
                                child: Text("1043"),
                                value: "1043",
                              ),
                            ],
                            value: _dropdownValue2,
                            onChanged: callBack2,
                            hint: Text("City"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Set Password';
                          }
                          return null;
                        },
                        controller: controller.passwordController.value,
                        decoration: InputDecoration(
                          label: const Text('Set Password'),
                          hintText: 'Set Password',
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
                              ? 'Please enter password'
                              : null,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Confirm Password';
                          }
                          return null;
                        },
                        controller: controller.confirmPasswordController.value,
                        decoration: InputDecoration(
                          label: const Text('Confirm Password'),
                          hintText: 'Confirm Password',
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
                              ? 'Please confirm password'
                              : null,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState?.validate() == true) {
                            controller.register();
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already a member?",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: 38,
                            width: 38,
                          ),
                          Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                          Icon(Bootstrap.apple),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
