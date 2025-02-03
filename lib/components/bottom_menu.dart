import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({
    super.key,
  });

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int currentPage = 0;
  void changePage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
/*         flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.red, Colors.blue]),
          ),
        ), */
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'VERY IMPORTNAT INFO ↓',
          ),
        ),
      ),
      extendBody: true, //<------like this
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: currentPage,
          // indicatorColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          // outlineBorderColor: Colors.black.withOpacity(0.1),
          onTap: changePage,
          items: [
            /// Add
            CrystalNavigationBarItem(
              icon: HugeIcons.strokeRoundedTicket01,
              unselectedIcon: HugeIcons.strokeRoundedTicket01,
              selectedColor: Colors.white,
            ),

            /// Home
            CrystalNavigationBarItem(
              icon: HugeIcons.strokeRoundedHome01,
              unselectedIcon: HugeIcons.strokeRoundedHome07,
              selectedColor: Colors.white,
            ),

            /// Search
            CrystalNavigationBarItem(
                icon: HugeIcons.strokeRoundedSearch01,
                unselectedIcon: HugeIcons.strokeRoundedSearch01,
                selectedColor: Colors.white),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.blue]),
        ),
        child: const Center(
          child: Text(
            'My babe ❤️',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
