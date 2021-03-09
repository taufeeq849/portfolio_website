import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/strings/about/about_strings.dart';
import 'package:portfolio_website/styles/textStyles.dart';
import 'package:portfolio_website/views/about/about_viewmodel.dart';
import 'package:portfolio_website/widgets/tech_tag/TechTag.dart';
import 'package:stacked/stacked.dart';

class AboutView extends StatelessWidget {
  AboutViewModel _aboutViewModel = new AboutViewModel();
  Widget _buildTechStack() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Tech Stack I've had experience with: ",
            textAlign: TextAlign.center,
            style: subheadingStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              ...familiarTechStack.map(
                    (tag) => TechItem(tag),
              )
            ],
          ),
        ]));
  }

  Widget _buildIconRow() {
    return Container(


      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 100,
            color: Colors.white,
            icon: new Image.asset('assets/icons/github_icon.png'),
            onPressed: () {
              _aboutViewModel.navigateToSocials('github');
            },
          ),
          IconButton(
            iconSize: 100,
            icon: new Image.asset('assets/icons/linkedin_icon.png'),
            onPressed: () {

              _aboutViewModel.navigateToSocials('linkedin');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (context, model, child) {
        return SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Text(
                  "About me: ",
                  style: mainHeadingStyle,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  aboutMainDesc,
                  style: infoStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTechStack(),
                SizedBox(
                  height: 50,
                ),
                _buildIconRow()
              ],
            ),
          ),
        );
      },
    );
  }
}
