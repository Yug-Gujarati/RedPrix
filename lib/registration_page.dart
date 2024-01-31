import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'component/custom_scaffold.dart';
import 'component/registration_controller.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegistrationController controller = Get.put(RegistrationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final isPasswordMatch = true.obs;
  String? _dropdownValue;
  String? _dropdownValue1;
  String? _dropdownValue2;

  void checkPasswordMatch() {
    isPasswordMatch.value = controller.passwordController.value.text ==
        controller.confirmPasswordController.value.text;
  }

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
            flex: 8,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText: _formKey.currentState?.validate() == false
                              ? 'Please enter name'
                              : null,
                        ),
                      ),
                      const SizedBox(
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
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText: _formKey.currentState?.validate() == false
                              ? 'Please enter email'
                              : null,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 100,
                                child: DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                      value: "100",
                                      child: Text("100"),
                                    ),
                                    DropdownMenuItem(
                                      value: "101",
                                      child: Text("101"),
                                    ),
                                    DropdownMenuItem(
                                      value: "102",
                                      child: Text("102"),
                                    ),
                                    DropdownMenuItem(
                                      value: "103",
                                      child: Text("103"),
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    label: const Text('Contry'),
                                    hintText: 'contry',
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            _formKey.currentState?.validate() ==
                                                    false
                                                ? Colors.red
                                                : Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            _formKey.currentState?.validate() ==
                                                    false
                                                ? Colors.red
                                                : Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorText:
                                        _formKey.currentState?.validate() ==
                                                false
                                            ? 'Contry'
                                            : null,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Contry';
                                    }
                                    return null;
                                  },
                                  elevation: 0,
                                  value: _dropdownValue,
                                  onChanged: callBack,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 80,
                                width: 100,
                                child: DropdownButtonFormField(
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
                                  decoration: InputDecoration(
                                    label: const Text('State'),
                                    hintText: 'State',
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            _formKey.currentState?.validate() ==
                                                    false
                                                ? Colors.red
                                                : Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            _formKey.currentState?.validate() ==
                                                    false
                                                ? Colors.red
                                                : Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorText:
                                        _formKey.currentState?.validate() ==
                                                false
                                            ? 'State'
                                            : null,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter State';
                                    }
                                    return null;
                                  },
                                  elevation: 0,
                                  value: _dropdownValue1,
                                  onChanged: callBack1,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 80,
                                width: 100,
                                child: DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                      value: "1040",
                                      child: Text("1040"),
                                    ),
                                    DropdownMenuItem(
                                      value: "1041",
                                      child: Text("1041"),
                                    ),
                                    DropdownMenuItem(
                                      value: "1042",
                                      child: Text("1042"),
                                    ),
                                    DropdownMenuItem(
                                      value: "1043",
                                      child: Text("1043"),
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    label: const Text('City'),
                                    hintText: 'City',
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            _formKey.currentState?.validate() ==
                                                    false
                                                ? Colors.red
                                                : Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            _formKey.currentState?.validate() ==
                                                    false
                                                ? Colors.red
                                                : Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorText:
                                        _formKey.currentState?.validate() ==
                                                false
                                            ? 'City'
                                            : null,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter City';
                                    }
                                    return null;
                                  },
                                  elevation: 0,
                                  value: _dropdownValue2,
                                  onChanged: callBack2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText: _formKey.currentState?.validate() == false
                              ? 'Please enter password'
                              : null,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm password is required';
                          } else if (value !=
                              controller.passwordController.value.text) {
                            return 'Passwords do not match';
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
                            borderSide: const BorderSide(color: Colors.red),
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
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true &&
                              controller.passwordController.value.text ==
                                  controller
                                      .confirmPasswordController.value.text) {
                            controller.register();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 10,
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
                                  builder: (context) => const LoginPage(),
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
                          const Icon(FontAwesomeIcons.facebook,
                              color: Colors.blue),
                          const Icon(Bootstrap.apple),
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
