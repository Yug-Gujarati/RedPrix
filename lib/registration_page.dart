import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'component/custom_scaffold.dart';
import 'component/registration_controller.dart';
import 'login_page.dart';

// class RegistrationRequest {
//   final String name;
//   final String email;
//   final String password;
//   final String confirmPassword;
//   final String countryId;
//   final String stateId;
//   final String cityId;

//   RegistrationRequest({
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.confirmPassword,
//     required this.countryId,
//     required this.stateId,
//     required this.cityId,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'email': email,
//       'password': password,
//       'confirm_password': confirmPassword,
//       'country_id': countryId,
//       'state_id': stateId,
//       'city_id': cityId,
//     };
//   }
// }

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
 
  final RegistrationController controller = Get.put(RegistrationController());
  final Dio _dio = Dio();
  double buttonheight = 45;
  double buttonwidth = 200;
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

  // Future<void> register() async {
  //   try {
  //     final RegistrationRequest registrationRequest = RegistrationRequest(
  //       name: nameController.text,
  //       email: emailController.text,
  //       password: passwordController.text,
  //       confirmPassword: confirmPasswordController.text,
  //       countryId: '101',
  //       stateId: '12',
  //       cityId: '1041',
  //     );

  //     Options options = Options(
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjQzNTYzNy1jMjJmLTQ2MzktODViZi00ZDViZjRhZmU4NzciLCJqdGkiOiI4Yzg1YTYwOGI4MzRmNDJhYjRmNDIwNGI0NTU4YjJiYzFiZGIyZjQ3MTg1NDVmNTdkY2RlMjY3NjgxZTdjNzRhZWFjZWNmZGI5NTZlNzM4YSIsImlhdCI6MTY1Mjc3NzYwOC40MzI5NTcsIm5iZiI6MTY1Mjc3NzYwOC40MzI5NiwiZXhwIjoxNjg0MzEzNjA4LjEzMzcwMSwic3ViIjoiMzYiLCJzY29wZXMiOltdfQ.ni8pUub6Qv4TgPcP65M1Bw-bjaH7mwFlxDJFbNb2_2xE_0pw1p6lfRTEqclTMUNcD621BSWJm_lm5gefDsCKFLB4O899aZqqlubl0NQoS4ye1CLm626kHCUkma3Mo5qPfv0ZMNDqYveqdvpzkmEoQ-JX6_2cub4SwsDkNDQAnWCF1R17QWSAhfPdYOm4s2IrFAYyBox0YCC4TgGzShQoU_PkSbGH3zphvJPc9adITsAEC5HTUgdsUTp1btoSZ5v1_N_2MtR_9bdJ8Z3VaShGdwvRtHtUKoW2y3bPU4QKFKxn3uZAZd0NOQgXHV1d4bJXpn5ltl7u459-pTEg8U6O4zHdEf9i0RmKcT_KqK6tq1EWptfrUAnxMih7L5sIXlHWEnHMWUw2MNMFyYrLZ5EXkYNwn1U1_Q_QcBZrlddwoLZj3V1Kg7MFgVLx-bELaQN02sKvdpR9j6nd0V0_gyPQ_Sf90Bx_s6B4KSzC7dyh6As6Nm-iuhW5z8jvYh1pxUqMDkmE78iUqG6Ppyfz_0aWhZklaEyFbfZqfuPw4YIoYR1ikgJH2yx47fN_A-t3SX3DlPtRSL7K8t5xihD7eYqAuudBtc4ZUZCI2ecVAfNXZ3CXr65_0Vx6HPeWCLmELPTnT-KTNpYfN87p26IkeIJ7BnB1hHLaWPD1JmgZ4YEMlTk', 
  //       },
  //     );

  //     Response response = await _dio.post(
  //       'https://uat.redprix.com/api/customers/customers',
  //       data: registrationRequest.toJson(),
  //       options: options,
  //     );
  //     if (response.statusCode == 201) {
  //       print('Account is Created');
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => HomePage(),
  //         ),
  //       );
  //     } else if (response.statusCode == 422) {
  //       showDialog(
  //         context: context,
  //         builder: ((context) => AlertDialog(
  //               title: Text("Email has alrady been taken"),
  //             )),
  //       );
  //     }
  //   } catch (error) {
  //     print("$error");

  //     showDialog(
  //       context: context,
  //       builder: ((context) => AlertDialog(
  //             title: Text("Email has alrady been taken"),
  //           )),
  //     );
  //   }
  // }

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
            flex: 7,
            child: Container(
                height: 400,
                padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Full Name';
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
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email';
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
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DropdownButton(
                            items: [
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
                            items: [
                              DropdownMenuItem(
                                child: Text("10"),
                                value: "10",
                              ),
                              DropdownMenuItem(
                                child: Text("11"),
                                value: "11",
                              ),
                              DropdownMenuItem(
                                child: Text("12"),
                                value: "12",
                              ),
                              DropdownMenuItem(
                                child: Text("13"),
                                value: "13",
                              ),
                            ],
                            value: _dropdownValue1,
                            onChanged: callBack1,
                            hint: Text("State"),
                          ),
                          DropdownButton(
                            items: [
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
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Set Password';
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
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm Password';
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
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          controller.register();
                          setState((){
                            buttonheight: 35;
                            buttonwidth: 150;
                          });
                        },
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            height: buttonheight,
                            width: buttonwidth,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
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
                            "Alrady member?",
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
                                  fontWeight: FontWeight.bold),
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
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
