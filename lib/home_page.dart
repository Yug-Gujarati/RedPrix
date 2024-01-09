import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'component/post_card.dart';

class HomePage extends StatefulWidget {
  final String token;
  HomePage({super.key, required this.token,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio dio = Dio();
  List<dynamic> reviews = [];
  String error = '';
  bool isLoading = false;
  List<Post> _posts = [];


 @override
  void initState() {
    super.initState();
    fetchPosts();
  }


  Future<void> fetchPosts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('auth_token')??'';
      print('$token');
      Response response = await dio.get('https://uat.redprix.com/api/customers/posts',
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType:ResponseType.json,
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': "application/json"  
            }
          ),
        );
        print(response.statusCode);
        print(response.data);
        if(response.statusCode == 200){
          print("-- $response");
        }
        else if(response.statusCode == 401){
          print("responsecode is 401");
        }

    } catch (e) {
      setState(() {
        error = 'Failed to fetch posts: $e';
        isLoading = false;
      });
      //print("---- ${e.toString()}");

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          titleSpacing: 0,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                      "assets/images/image1.jpg",
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "Foodfie Zone",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      width: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // Filter icon
                  IconButton(
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              )),
        ),
    body: ListView.builder(
      itemCount: _posts.length,
      itemBuilder: ((context, index) {
        return PostCard(post: _posts[index]);
      })
     ),
    );
  }
}
