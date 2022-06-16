import 'package:book_exchange/screens/homepage.dart';
import 'package:book_exchange/screens/sign_in.dart';
import 'package:book_exchange/screens/sign_up.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  var pages = [HomePage(), Login(), SignUp()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(155, 96, 220, 1),
        toolbarHeight: 70,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.camera_alt_outlined),
                  color: Colors.black,
                  onPressed: null,
                ),
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_sharp),
                color: Colors.black54,
                iconSize: 35,
              )
            ],
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(155, 96, 220, 1),
        selectedItemColor: const Color.fromRGBO(0, 0, 0, 1),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: (Icon(Icons.home_outlined)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    currentIndex = index;
    setState(() {});
  }
}
