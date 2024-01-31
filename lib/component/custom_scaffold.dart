import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/image1.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const Positioned(
            top: 50,
            child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                         style: TextStyle(color: Colors.yellow, fontSize: 26,),
                        ),
                        Text(
                          "Welcome Back to Redpix", 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          "Login to Connect with app", 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
          ),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}