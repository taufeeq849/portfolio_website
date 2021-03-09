import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/styles/textStyles.dart';
import 'package:portfolio_website/views/resume/resume_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TestimonialsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TestimonialsViewModel(),
      builder: (context, model, child) {
        return Center(
          child: Text("Testi's"),
        );
      },
    );
  }
}
