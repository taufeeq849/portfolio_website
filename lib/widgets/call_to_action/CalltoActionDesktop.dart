import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_colors.dart';

class CalltoActionButtonDesktop extends StatelessWidget {
  final String title;
  final Color color;
  const CalltoActionButtonDesktop(this.title, this.color);

  @override
Widget build(BuildContext context) {
  return Container(

    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    ),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5)),
  );
}
}