
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/search_screen.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> pages = [const HomeScreen(), SearchScreen()];
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          onTap: updatePage,
          currentIndex: _page,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: SizedBox(
                width: bottomBarWidth,
                child: const Icon(Icons.home_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SizedBox(
                width: bottomBarWidth,
                child: const Icon(Icons.search_outlined),
              ),
            ),
          ]),
    );
  }
}
