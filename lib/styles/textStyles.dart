

  import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Returns the style for a page title based on the [deviceScreenType] passed in.
  TextStyle titleTextStyle(DeviceScreenType deviceScreenType) {
    double titleSize = deviceScreenType == DeviceScreenType.mobile ? 50 : 80;
    return TextStyle(
        fontWeight: FontWeight.w800, height: 0.9, fontSize: titleSize);
  }

  /// Return the style for description text on a page based on the [deviceScreenType] passed in.
  TextStyle descriptionTextStyle(DeviceScreenType deviceScreenType) {
    double descriptionSize =
    deviceScreenType == DeviceScreenType.mobile ? 16 : 21;

    return TextStyle(
      fontSize: descriptionSize,
      height: 1.7,
    );
  }
  TextStyle mainHeadingStyle = new TextStyle(fontWeight: FontWeight.bold, fontSize: 23);
  TextStyle subheadingStyle = new TextStyle(fontWeight: FontWeight.w800, fontSize: 18);
  TextStyle infoStyle = new TextStyle(fontWeight: FontWeight.w500, fontSize: 16);
