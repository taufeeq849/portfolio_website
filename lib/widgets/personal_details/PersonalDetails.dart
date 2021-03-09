import 'package:flutter/material.dart';
import 'package:portfolio_website/strings/home/home_strings.dart';
import 'package:portfolio_website/widgets/call_to_action/CulminatedCalltoAction.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails(
      {Key key,
      topTitle,
      nameTitle,
      infoBlurb,
      yearsOfExperience = 3,
      numOfProjects = 14})
      : super(key: key);
  String topTitle = 'Mobile Application Developer';
  String nameTitle = 'TAUFEEQ RAZAK ';

  String infoBlurb = secondHomeString;
  int yearsOfExperience = 3;

  int numOfProjects = 14;

  Widget _buildMetric(int num, String text) {
    return Container(
      width: 200,
      child: Row(
        children: [
          Text(
            num.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 44),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? TextAlign.left
                : TextAlign.center;
        double topTitleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 14
                : 14;
        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 42
                : 30;
        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 14
                : 14;
        return Container(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                topTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: topTitleSize,
                  height: 1.6,
                ),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 5,

                decoration: BoxDecoration(
                    border: Border(top: BorderSide()),
                    color: Color.fromRGBO(56, 252, 254, 1)),
              ),
              Text(
                nameTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: titleSize,
                  height: 1.6,
                ),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                infoBlurb,
                style: TextStyle(
                  fontSize: descriptionSize,
                  height: 1.7,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMetric(
                      yearsOfExperience, 'YEARS REAL-WORLD EXPERIENCE'),
                  _buildMetric(numOfProjects, 'PRODUCTION PROJECTS')
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CallToAction(
                text: 'View Portfolio',
              )
            ],
          ),
        );
      },
    );
  }
}
