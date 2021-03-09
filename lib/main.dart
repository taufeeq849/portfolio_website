import 'package:flutter/material.dart';
import 'package:portfolio_website/locator.dart';
import 'package:portfolio_website/views/layout_template/layout_template.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                displayColor: Colors.white,
                bodyColor: Colors.white,
                fontFamily: 'Montserrat')),
        debugShowCheckedModeBanner: false,
        home: LayoutTemplate());
  }
}
