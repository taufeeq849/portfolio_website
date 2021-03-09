import 'package:flutter/material.dart';
import 'package:portfolio_website/models/data_models.dart';
import 'package:portfolio_website/styles/textStyles.dart';
import 'package:portfolio_website/widgets/projects_tile/ProjectTile.dart';
import 'package:portfolio_website/widgets/ui_helpers.dart';

class PortfolioContentMobile extends StatelessWidget {
  PortfolioData portfolioData;
  Function navigateToSpecificProject;

  PortfolioContentMobile({this.portfolioData, this.navigateToSpecificProject});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    print(size.height);
    print(size.width);
    return portfolioData != null
        ? Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PortfolioTitle(portfolioData.portfolioTitle),
                    Container(
                      width: size.height > 800
                          ? size.width * 0.4
                          : size.width * 0.3,
                      child: Image.network(portfolioData.previewImageUrl),
                    ),
                  ]),
              verticalSpaceLarge,
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: portfolioData.projects
                      .map((Project e) =>
                      GestureDetector(
                        onTap: () => navigateToSpecificProject(e),
                        child: ProjectTile(
                          project: e,
                        ),
                      ))
                      .toList()),
            ],
          ),
        ))
        : Center(
      child: Text(
        'Error in retrieving data, try again later.',
        style: mainHeadingStyle,
      ),
    );
  }
}