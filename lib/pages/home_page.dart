import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticker_app/res/styles/app_styles.dart';

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
  )..;
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: const Offset(0.0, 1.5),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

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
                          child: Image.asset('assets/images/plane_icon.png'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  GlassmorphicTextField(),
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
