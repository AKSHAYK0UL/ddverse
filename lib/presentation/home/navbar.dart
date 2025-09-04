import 'package:ddverse/presentation/history/screen/history.dart';
import 'package:ddverse/presentation/scan/screen/reading.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final screens = [Reading(), History()];
  int currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIdx, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIdx,
        onTap: (value) {
          setState(() {
            currentIdx = value;
          });
        },
        selectedLabelStyle: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.speed, size: 25),
            label: "Test",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 25),
            label: "Reports",
          ),
        ],
      ),
    );
  }
}
