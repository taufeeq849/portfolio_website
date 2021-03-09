import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/models/data_models.dart';
import 'package:portfolio_website/models/project.dart';
import 'package:portfolio_website/widgets/blue_line.dart';
import 'package:portfolio_website/widgets/projects_tile/ProjectTileViewModel.dart';
import 'package:responsive_builder/responsive_builder.dart';

// import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class ProjectTile extends StatelessWidget {
  final Project project;
  final bool isMobile;

  const ProjectTile({Key key, this.project, this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 20, color: project.color)),
        color: Color.fromRGBO(22, 23, 25, 1),
      ),
      height: 200,
      width: isMobile ? double.infinity : 272,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Column(
          children: [
            Text(
              project.projectName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              project.projectDesc,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}
