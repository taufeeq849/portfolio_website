import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_colors.dart';

class CalltoActionButtonMobile extends StatelessWidget {
  final String title;
  const CalltoActionButtonMobile(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,

      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}