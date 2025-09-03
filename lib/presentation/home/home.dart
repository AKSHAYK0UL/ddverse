import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = "/home";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person, size: 26)),
        ],
      ),
      body: Center(child: Text("Home Page")),
    );
  }
}
