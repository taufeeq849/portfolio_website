import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/styles/textStyles.dart';
import 'package:portfolio_website/views/specificProject/specific_project_viewmodel.dart';
import 'package:portfolio_website/widgets/call_to_action/CalltoActionDesktop.dart';
import 'package:portfolio_website/widgets/tech_tag/TechTag.dart';
import 'package:portfolio_website/widgets/video_gif/VideoGif.dart';
import 'package:stacked/stacked.dart';

class SpecificProjectView extends StatelessWidget {
  SpecificProjectViewModel _specificProjectViewModel =
      SpecificProjectViewModel();

  SpecificProjectView();

  Widget _buildTopSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            _specificProjectViewModel.navigateBack();
          },
        ),
        Flexible(
          child: Text(
            _specificProjectViewModel.project != null
                ? _specificProjectViewModel.project.title
                : 'Error in loading information, please try again later!',
            style: mainHeadingStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Container()
      ],
    );
  }

  Widget _buildDescriptionColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Description",
            textAlign: TextAlign.left,
            style: subheadingStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _specificProjectViewModel.project.extendedDescription,
            textAlign: TextAlign.center,
            style: infoStyle,
          )
        ],
      ),
    );
  }

  Widget _buildTechDetails() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Tech Stack Used: ",
            textAlign: TextAlign.left,
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
              ..._specificProjectViewModel.project.techTags.map(
                (tag) => TechItem(tag),
              )
            ],
          ),
        ]));
  }

  Widget _buildVideoGifs() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 50,
      runSpacing: 50,
      children: [
        ..._specificProjectViewModel.project.videoModels
            .map((e) => VideoGif(e.title, e.videoPath))
      ],
    );
  }

  Widget _buildViewCodeBtn() {
    return GestureDetector(
        onTap: () {
          _specificProjectViewModel
              .navigatetoUrl(_specificProjectViewModel.project.githubLink);
        },
        child: CalltoActionButtonDesktop('View Code!', Colors.green));
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SpecificProjectViewModel>.reactive(
        viewModelBuilder: () => _specificProjectViewModel,
        builder: (context, model, child) {
          _specificProjectViewModel.getProject();
          return Container(
            color: projectTileColor,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _buildTopSection(),
                  _buildVideoGifs(),
                  _buildDescriptionColumn(),
                  _buildTechDetails(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildViewCodeBtn()
                ],
              ),
            ),
          );
        });
  }
}

class ViewCodeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Text(
        'View Code',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(5)),
    );
  }
}
