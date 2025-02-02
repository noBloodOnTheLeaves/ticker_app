import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.red, Colors.blue]),
          ),
        ),
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
              icon: Icons.airplane_ticket,
              unselectedIcon: Icons.airplane_ticket_outlined,
              selectedColor: Colors.white,
            ),

            /// Home
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: Colors.white,
            ),

            /// Search
            CrystalNavigationBarItem(
                icon: Icons.search,
                unselectedIcon: Icons.search_outlined,
                selectedColor: Colors.white),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
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
