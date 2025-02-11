import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticker_app/res/styles/app_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                        child: Icon(
                          HugeIcons.strokeRoundedAirplane02,
                          size: 35,
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
            color: Colors.transparent,
          ),
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
                hintText: 'Senders name',
                suffixIcon: Icon(HugeIcons.strokeRoundedSearch01),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
