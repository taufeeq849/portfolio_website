import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/models/data_models.dart';
import 'package:portfolio_website/models/project.dart';

class StateManager {
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldState => _scaffoldState;

  Project project;

  setProject(project) {
    this.project = project;
  }
}
