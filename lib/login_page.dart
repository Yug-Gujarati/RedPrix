import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import 'component/custom_scaffold.dart';
import 'component/login_controller.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageController controller = Get.put(LoginPageController());
  double buttonwidth = 200;
  double buttonheight = 45;

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
                padding: const EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 20.0),
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
                        height: 70,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
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
                                color: Colors.black12, 
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
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
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.blue[400]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            controller.login(); 
                            setState((){
                              buttonwidth = 150;
                              buttonheight= 35;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            height: buttonheight,
                            width: buttonwidth,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white, fontSize: 20),
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
                                  builder: (context)=> RegistrationPage(),
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
                          Image.asset("assets/images/google.png", height: 38, width: 38,),
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