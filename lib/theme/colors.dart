import 'package:flutter/material.dart';

class AppColors{
  AppColors._();
  static const Gradient baseGradient = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0XFF7c91f9),Color(0XFF01196d)]);
  static const Gradient disableGradient = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0XFF9db3dd),Color(0XFFd9e6fe)]);
  static const Color titleTextColor = const Color(0xff48668a);
  static const Color hintTextColor = const Color(0xff6f84a4);
  static const Color inputTextColor = const Color(0xff314768);
  static const Color activeTabTextColor = const Color(0xff1a4bb7);
  static const Color selectedTabLabelColor = const Color(0xff326fe3);
  static const Color unselectedTabLabelColor = const Color(0xff6f84a4);
  static const Color tabIndicatorColor = const Color(0xff326fe3);
  static const Color iconInputColor = const Color(0xff314768);
  static const Color bgInputColor = const Color(0xffe7effa);
  static const Color avatarBgColor = const Color(0xffe7effa);
  static const Color lineDividerColor = const Color(0xffe7effa);
  static const Color searchBarColor = const Color(0xffe7effa);
  static const Color textSelectedColor = const Color(0xff0d50b0);
  static const Color textUnSelectedColor = const Color(0xff314768);
  static const Color textInputColor = const Color(0xff314768);
  static const Color errorInputColor = const Color(0xfff75252);
  static const Color redTextColor = const Color(0xfff75252);
  static const Color blueTextColor = const Color(0xff326fe3);
  static const Color loadingIndicatorColor = const Color(0xff326fe3);
  static const Color radioActiveColor = const Color(0xff326fe3);
  static const Color dividerGray = const Color(0xffeaeaea);
  static const Color borderSideColor = const Color(0xffeaeaea);
  static const Color disableColor = const Color(0x80d1d1d1);
  static const Color indicatorActiveColor = const Color(0xff558aff);
  static const Color indicatorInActiveColor = const Color(0xffc9d3de);
  static const Color iconDownColor = const Color(0xff6f84a4);
  static const Color defaultTextColor = const Color(0xff314768);


  static const Color bgColor = Color(0xfff7f7f7);
  static const Color primaryColor = MaterialColor(0xFF262626, _color);
  static const Color accentColor = Color(0xFFFFCE00);
  static const Color lightGrey = Color(0xFFBFBFBF);
  static const Color facebook = Color(0xFF3b5998);
  static const Color grey = Color(0xff8c8c8c);
  static const Map<int, Color> _color = {
    50: Color(0xFF262626),
    100: Color(0xFF262626),
    200: Color(0xFF262626),
    300: Color(0xFF262626),
    400: Color(0xFF262626),
    500: Color(0xFF262626),
    600: Color(0xFF262626),
    700: Color(0xFF262626),
    800: Color(0xFF262626),
    900: Color(0xFF262626),
  };
  static const Color inactiveButton = Color(0xFFEAEAEA);
  static const Color activeButton = Color(0xFFFFCE00);
  static const Color textDark = Color(0xFF0D0D0D);
  static const Color textDefault = MaterialColor(0xFF262626, _color);
  static const Color textGray = Color(0xFF7C7D80);
  static const Color textBlack = Color(0xFF111315);
  static const Color backgroundDarkGray = Color(0xFF24272C);
  static const Color backgroundGray = Color(0xFF7C7D80);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundBlack = Color(0xFF111315);
  static const Color progressBarPlayedColor = Color(0xFFFEC52E);
  static const Color progressBarHandleColor = Color(0xFFFEC52E);
  static const Color progressBarBufferedColor = Color(0xB3FFFFFF);
  static const Color progressBarBackgroundColor = Color(0xFF24272C);
  static const Color backgroundChip = Color(0xFF24272C);

  static const Color bgIntroScreen = Color(0xFF111315);
  static const Color bgBottomSheet = Color(0xFF111315);
  static const Color colorDivider = Color(0xFF7C7D80);
  static const Color textYellow = Color(0xFFFEC52E);
  static const Color colorIconYellow = Color(0xFFFEC52E);
  static const Color textFieldBorder = Color(0xFF7C7D80);
  static const Color startButtonActiveColor = Color(0xFFFD9E2A);
  static const Color startButtonInActiveColor = Color(0xFF575656);
  static const Color endButtonActiveColor = Color(0xFFFC371E);
  static const Color endButtonInActiveColor = Color(0xFF2F333A);
  static const Color snackBarBackground = Color(0xFF24272C);
  static const Color dialogBackground = Color(0xFF292929);
  static const Color toolbarBackground = Color(0xFF111315);
  static const Color toolbarGrayBackground = Color(0xFF24272C);
  static const Color bottomNavigationBackground = Color(0xFF111315);
  static const Color startBackgroundHomeGradient = Color(0xFFFEC52E);
  static const Color endBackgroundHomeGradient = Color(0xFF622301);

  static const Color indicatorInactiveColor = Color(0xFF3B3F46);

  static const Color selectedCategoryBackground = Color(0xFFFEC52E);
  static const Color unSelectedCategoryBackground = Color(0xFF111315);

  static const Color startBannerColor = Color(0x00111315);
  static const Color endBannerColor = Color(0xFF111315);

  static const Color unratedColor = Color(0xFF64511E);
  static final Color pipControllerViewButtonColor = Color(0xFF24272C).withOpacity(0.5);

  static const Gradient buttonActiveGradient = LinearGradient(
    colors: <Color>[AppColors.startButtonActiveColor, AppColors.endButtonActiveColor],
  );

  static const Gradient buttonInActiveGradient = LinearGradient(
    colors: <Color>[AppColors.startButtonInActiveColor, AppColors.endButtonInActiveColor],
  );

  static const Gradient bannerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [
      0.3,
      0.4,
      0.5,
    ],
    colors: <Color>[AppColors.startBannerColor, AppColors.startBannerColor, AppColors.endBannerColor],
  );

  static const Gradient mainTabGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [
      0.1,
      0.3,
      0.5,
    ],
    colors: <Color>[AppColors.startBannerColor, AppColors.endBannerColor, AppColors.endBannerColor],
  );

  static const Color startContainerColor = Color(0xFFFEC52E);
  static const Color endContainerColor = Color(0xFFFC371E);
  static const Color backgroundButtonRed = Color(0xFFFC371E);
  static const Color shadowButtonRed = Color(0xFFE44D26);
  static const Color backgroundVideosPage = Color(0xFF24272C);

  static const Gradient containerGradient =
  RadialGradient(colors: <Color>[AppColors.startContainerColor, AppColors.endContainerColor], radius: 3.5, center: Alignment.topLeft);



}