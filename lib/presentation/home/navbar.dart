import 'package:ddverse/presentation/home/home.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final screens = [Home(), Home()];
  int currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIdx = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: "Take Reading",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "View History",
          ),
        ],
      ),
    );
  }
}
