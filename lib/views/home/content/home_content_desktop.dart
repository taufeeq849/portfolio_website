import 'package:flutter/material.dart';
import 'package:portfolio_website/models/data_models.dart';
import 'package:portfolio_website/strings/home/home_strings.dart';
import 'package:portfolio_website/widgets/call_to_action/CulminatedCalltoAction.dart';

import 'package:portfolio_website/widgets/personal_details/PersonalDetails.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop(HomeData homeData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Row(
        children: <Widget>[
          PersonalDetails(
            topTitle: 'Mobile Application Developer',
            nameTitle: 'TAUFEEQ RAZAK',
            key: key,
            yearsOfExperience: 3,
            numOfProjects: 14,
          ),
          Container(
            height: size.width / 3,
          ),
          Expanded(
            child: Container(
              height: size.height / 1.5,
              child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/portfolio-c88cb.appspot.com/o/stack_image.png?alt=media&token=71f0c1f6-426e-4a61-a3a9-d449083e9bc8'),
            ),
          )
        ],
      ),
    );
  }
}
