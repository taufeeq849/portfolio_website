import 'package:flutter/material.dart';
import 'package:portfolio_website/styles/textStyles.dart';

import 'package:portfolio_website/views/home/content/home_content_desktop.dart';
import 'package:portfolio_website/views/home/content/home_content_mobile.dart';
import 'package:portfolio_website/views/home/home_viewmodel.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) => model.fetchHomeData(),
      builder: (context, HomeViewModel model, child) {
        return model.isBusy
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue)),
              )
            : model.homeData != null
                ? ScreenTypeLayout(
                    mobile: HomeContentMobile(model.homeData),
                    tablet: HomeContentMobile(model.homeData),
                    desktop: HomeContentDesktop(model.homeData),
                  )
                : Center(
                    child: Text(
                      'Error in fetching data, try again later',
                      style: mainHeadingStyle,
                    ),
                  );
      },
    );
  }
}
