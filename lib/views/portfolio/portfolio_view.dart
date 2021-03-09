import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/models/data_models.dart';
import 'package:portfolio_website/styles/textStyles.dart';
import 'package:portfolio_website/views/portfolio/porfolio_viewmodel.dart';
import 'package:portfolio_website/widgets/blue_line.dart';
import 'package:portfolio_website/widgets/polygon_custom_painter.dart';
import 'package:portfolio_website/widgets/projects_tile/ProjectList.dart';
import 'package:portfolio_website/widgets/projects_tile/ProjectTile.dart';
import 'package:portfolio_website/widgets/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class PortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PortfolioViewModel(),
      onModelReady: (PortfolioViewModel model) {
        model.fetchPortfolioData();
      },
      builder: (context, PortfolioViewModel model, child) {
        var size = MediaQuery.of(context).size;
        print(size.height);
        print(size.width);
        return model.isBusy
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              )
            : model.portfolioData != null
                ? Scaffold(
                    backgroundColor: Colors.black,
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlueLine(),
                                    verticalSpaceSmall,
                                    Container(
                                      width: 250,
                                      child: Text(
                                        model.portfolioData.portfolioTitle,
                                        style: mainHeadingStyle,
                                      ),
                                    ),
                                    verticalSpaceSmall,
                                    CustomPaint(
                                      painter: PolygonCustomPainter(),
                                      size: Size(100, 100),
                                    )
                                  ],
                                ),
                                Container(
                                  width: size.height > 800 ? size.width * 0.4 : size.width * 0.3,
                                  child: Image.network(
                                      model.portfolioData.previewImageUrl),
                                ),
                              ]),
                          verticalSpaceLarge,
                          Stack(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: model.portfolioData.projects
                                      .map((Project e) => GestureDetector(
                                            onTap: () => model
                                                .navigateToSpecificProject(e),
                                            child: ProjectTile(
                                              project: e,
                                            ),
                                          ))
                                      .toList()),
                              Positioned(
                                bottom: 10,
                                child: Container(
                                  height: 281,
                                  color: Color.fromRGBO(59, 62, 78, 0.6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                : Center(
                    child: Text(
                      'Error in retrieving data, try again later.',
                      style: mainHeadingStyle,
                    ),
                  );
      },
    );
  }
}
