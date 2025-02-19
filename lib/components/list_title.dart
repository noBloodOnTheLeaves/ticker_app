import 'package:flutter/material.dart';
import '../res/styles/app_styles.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key, required this.title, required this.viewAll});
  final String title;
  final String viewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.titleText),
        InkWell(
          onTap: () {},
          child: Text(viewAll, style: AppStyles.viewText),
        ),
      ],
    );
  }
}
