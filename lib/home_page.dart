import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/post_card.dart';

class HomePage extends StatefulWidget {
  final String token;
  const HomePage({
    super.key,
    required this.token,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio dio = Dio();
  List<dynamic> reviews = [];
  String error = '';
  bool isLoading = false;
  var posts = <Post>[].obs;

  List<String> profile = [
    'assets/images/profile/profile1.jpg',
    'assets/images/profile/profile1.jpg',
    'assets/images/profile/profile3.jpg',
    'assets/images/profile/profile4.jpg',
    'assets/images/profile/profile4.jpg',
    'assets/images/profile/profile6.jpg',
    'assets/images/profile/profile6.jpg',
    'assets/images/profile/profile6.jpg',
    'assets/images/profile/profile6.jpg',
    'assets/images/profile/profile6.jpg',
    'assets/images/profile/profile11.jpg',
    'assets/images/profile/profile13.jpg',
    'assets/images/profile/profile13.jpg',
  ];
  List<String> images = [
    'assets/images/image/image2.jpg',
    'assets/images/image/image3.jpg',
    'assets/images/image/image4.jpg',
    'assets/images/image/image5.jpg',
    'assets/images/image/image6.jpg',
    'assets/images/image/image7.jpg',
    'assets/images/image/image8.jpg',
    'assets/images/image/image9.jpg',
    'assets/images/image/image10.jpg',
    'assets/images/image/image11.jpg',
    'assets/images/image/image12.jpg',
    'assets/images/image/image13.jpg',
    'assets/images/image/image14.jpg',
  ];

  @override
  void initState() {
    super.initState();
    fetchPostsFromAllAPIs();
  }

  Future<void> fetchPostsFromAllAPIs() async {
    final List<String> apiEndpoints = [
      'http://uat.redprix.com/api/posts/1323',
      'http://uat.redprix.com/api/posts/1305',
      'http://uat.redprix.com/api/posts/1340',
      'http://uat.redprix.com/api/posts/1202',
      'http://uat.redprix.com/api/posts/1201',
      'http://uat.redprix.com/api/posts/1314',
      'http://uat.redprix.com/api/posts/1289',
      "http://uat.redprix.com/api/posts/1268",
      "http://uat.redprix.com/api/posts/1259",
      "http://uat.redprix.com/api/posts/1137",
      "http://uat.redprix.com/api/posts/1221",
      "http://uat.redprix.com/api/posts/1330",
      "http://uat.redprix.com/api/posts/1277",
    ];

    for (final String apiEndpoint in apiEndpoints) {
      await fetchPosts(apiEndpoint);
    }
  }

  Future<void> fetchPosts(String apiEndpoint) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('auth_token') ?? '';
      final Dio dio = Dio();
      final response = await dio.get(
        apiEndpoint,
        options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              //'Authorization': 'Bearer $token',
              HttpHeaders.authorizationHeader: 'Bearer $token',
              'Accept': 'application/json', 
            }
          ),
      );

      if (response.statusCode == 200) {
        final dynamic responseData = response.data['data'];

        if (responseData is List) {
          final List<Post> fetchedPosts =
              responseData.map((post) => Post.fromJson(post)).toList();
          posts.addAll(fetchedPosts);
        } else if (responseData is Map<String, dynamic>) {
          final Post singlePost = Post.fromJson(responseData);
          posts.add(singlePost);
        }
      } else {
        print('Error fetching posts from $apiEndpoint');
      }
    } catch (e) {
      print('Dio error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text(
          "Foodfie Zone",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 5,
            backgroundImage: AssetImage(
              "assets/images/image1.jpg",
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none, color: Colors.white)),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
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
                const SizedBox(width: 14.0),
                // Filter icon
                IconButton(
                  icon: const Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                color: Colors.red,
                size: 200,
              ))
            : ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: 390,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                profile[index],
                              ),
                              radius: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.userName,
                                  style: const TextStyle(fontWeight: FontWeight.w700),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 12,
                                    ),
                                    Text(
                                      "Surat City",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          post.title,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          post.description,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Divider(
                          color: Colors.grey[800],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.thumb_up_alt_outlined)),
                              Text(post.likesCount),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.comment_rounded)),
                              Text(post.commentsCount),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share_outlined)),
                              Text(post.sharCount),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
