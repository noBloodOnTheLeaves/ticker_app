import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticker_app/components/glass_card.dart';
import 'package:ticker_app/components/list_title.dart';
import 'package:ticker_app/res/styles/app_styles.dart';
import 'package:ticker_app/res/media.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: const Offset(0.0, 1.5),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  List cards = [
    {
      "imageUrl": "assets/images/paris.jpg",
      "title": "Paris",
      "description": "Experience the city of love"
    },
    {
      "imageUrl": "assets/images/new_york.jpg",
      "title": "New York",
      "description": "The city that never sleeps"
    },
    {
      "imageUrl": "assets/images/tokyo.jpg",
      "title": "Tokyo",
      "description": "Modern meets traditional"
    },
    {
      "imageUrl": "assets/images/moscow.jpg",
      "title": "Moscow",
      "description": "Some description here"
    },
    {
      "imageUrl": "assets/images/italy.jpg",
      "title": "Italy",
      "description": "Experience the beauty of Italy"
    }
  ];

  void repeatOnce() async {
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  void initState() {
    super.initState();
    repeatOnce();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.blue]),
        ),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning',
                            style: AppStyles.aboveHeadlineText,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Book Tickets',
                            style: AppStyles.headlineText,
                          )
                        ],
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: Image.asset(AppMedia.logo),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  GlassmorphicTextField(),
                  SizedBox(height: 50),
                  ListTitle(title: "Where to go?", viewAll: "View all"),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: cards
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: GlassCard(
                                  imageUrl: e["imageUrl"],
                                  title: e["title"],
                                  description: e["description"],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GlassmorphicTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: Container(
          padding: EdgeInsets.only(bottom: 5, top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white24),
              gradient: LinearGradient(colors: [
                Colors.white10.withOpacity(0.1),
                Colors.white24.withOpacity(0.3),
              ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'Search tickets ...',
                suffixIcon: Icon(HugeIcons.strokeRoundedSearch01),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
