import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import 'component/custom_scaffold.dart';
import 'component/login_controller.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageController controller = Get.put(LoginPageController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                padding: const EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                  color:
                                      _formKey.currentState?.validate() == false
                                          ? Colors.red
                                          : Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      _formKey.currentState?.validate() == false
                                          ? Colors.red
                                          : Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorText:
                                  _formKey.currentState?.validate() == false
                                      ? 'Please enter email'
                                      : null,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        // email
                        SizedBox(
                          width: 350,
                          height: 70,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                            controller: controller.passwordController.value,
                            decoration: InputDecoration(
                              label: const Text('Password'),
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      _formKey.currentState?.validate() == false
                                          ? Colors.red
                                          : Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      _formKey.currentState?.validate() == false
                                          ? Colors.red
                                          : Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorText:
                                  _formKey.currentState?.validate() == false
                                      ? 'Please enter Password'
                                      : null,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.blue[400]),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              controller.login();
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
                              horizontal: 60,
                              vertical: 10,
                            ),
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign Up",
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
                            const Icon(FontAwesomeIcons.facebook,
                                color: Colors.blue),
                            const Icon(Bootstrap.apple),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}


//class _LoginPageState extends State<LoginPage> {
// TextEditingController _emailController = TextEditingController();
// TextEditingController _passwordController = TextEditingController();
//   final Dio _dio = Dio();
//   String token = '';
//   String message = '';

//   Future<void> _login() async{
//     try{
//       Response response = await _dio.post(
//         'https://uat.redprix.com/api/login',
//         data :{
//           'email': _emailController.text,
//           'password': _passwordController.text,
//         },
//       );
//       if(response.statusCode == 200){
//         Navigator.pushReplacement(
//           context, 
//           MaterialPageRoute(
//             builder: (context) => HomePage(token: '',),
//           ),
//         );
//        Map<String, dynamic> responseData = response.data['data'];
//         token = responseData['authorization'];
//         message = response.data['message'];

//         print('authorization: $token');
//         print('message: $message');

//         }else{
//         showDialog(
//         context: context, 
//         builder: ((context) => AlertDialog(
//           title: Text("Invalid email or password"), 
//          )
//         ),
//       );
//       }
//   } catch (error) {
//     showDialog(
//         context: context, 
//         builder: ((context) => AlertDialog(
//           title: Text("Invalid email or password"), 
//          )
//         ),
//       );
//   }
// }