import 'package:flutter/material.dart';
import 'package:portfolio_website/models/data_models.dart';
import 'package:portfolio_website/strings/home/home_strings.dart';

import 'package:portfolio_website/widgets/call_to_action/CulminatedCalltoAction.dart';
import 'package:portfolio_website/widgets/personal_details/PersonalDetails.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile(HomeData homeData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PersonalDetails(),
          SizedBox(
            height: 30,
          ),
          CallToAction(),
        ],
      ),
    );
  }
}
