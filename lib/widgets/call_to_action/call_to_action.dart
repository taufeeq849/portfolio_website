import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/call_to_action/CalltoActionDesktop.dart';
import 'package:portfolio_website/widgets/call_to_action/CalltoActionMobile.dart';

import 'package:portfolio_website/widgets/call_to_action/CulminatedCallstoActionDesktop.dart';
import 'package:portfolio_website/widgets/call_to_action/CulminatedCallstoActionMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CallToAction extends StatelessWidget {
  String text;
  Color color;

  CallToAction({this.text = 'Press Here', this.color = const Color.fromRGBO(38, 57, 247, 1)});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: CalltoActionButtonMobile(text),
        desktop: CalltoActionButtonDesktop(text, color)); 
  }
}
