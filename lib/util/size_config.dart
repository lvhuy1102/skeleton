import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Size systemSize;
  static Orientation orientation;
  static double appBarHeight;
  static double bottomNavHeight;
  static double channelItemHeight;
  static double channelItemWidth;
  static double movieItemHeight;
  static double movieItemWidth;
  static double videoItemHeight;
  static double videoItemWidth;
  static bool isTablet;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    systemSize = Size(screenWidth, screenHeight);
    channelItemHeight = getProportionateScreenHeight(90);
    channelItemWidth = getProportionateScreenHeight(160);
    movieItemHeight = getProportionateScreenHeight(215);
    movieItemWidth = getProportionateScreenHeight(100);
    videoItemHeight = getProportionateScreenHeight(146);
    videoItemWidth = getProportionateScreenHeight(160);
    var smallestDimension = MediaQuery.of(context).size.shortestSide;
// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    isTablet = smallestDimension >= 600;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 736.0 is the layout height that Tu Tran use
  return (inputHeight / 736.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 414.0 is the layout width that Tu Tran use
  return (inputWidth / 414.0) * screenWidth;
}

double getProportionateTextSize(double inputTextSize) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputTextSize / 414.0) * screenWidth;
}

double getTextScale(double inputScreenWidth) {
  return (inputScreenWidth / 414.0);
}

class VerticalSpacing extends StatelessWidget {
  final double value;

  const VerticalSpacing(
    this.value, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(value ?? 10),
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  final double value;

  const HorizontalSpacing(
    this.value, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(value ?? 10),
    );
  }
}
