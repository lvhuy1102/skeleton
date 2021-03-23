import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeleton_flutter/net/dioHelper.dart';
import 'package:skeleton_flutter/notifications/notifcation.dart';
import 'package:skeleton_flutter/notifications/notifcation.dart';
import 'package:skeleton_flutter/router/router_path.dart';
import 'package:skeleton_flutter/ui/main/main_page.dart';
import 'package:skeleton_flutter/ui/main/qr_scanner.dart';
import 'package:skeleton_flutter/ui/splash.dart';
import 'theme/colors.dart';
import 'theme/style.dart';


Future<void> main() async {
  AppNotification.init();
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  DioHelper.dioObject;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value){
    runApp(
      MyApp()
    );
  });
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    // Wakelock.enable();
    // PreferenceManager.init();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.bottomNavigationBackground,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      navigatorKey: navigatorKey,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: AppColors.primaryColor,
          accentColor: AppColors.accentColor,
          textTheme: AppStyles.textTheme,
          canvasColor: Colors.white,
          scaffoldBackgroundColor: AppColors.bgIntroScreen,
          unselectedWidgetColor: Colors.white,
          cupertinoOverrideTheme: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle:
                TextStyle(color: AppColors.textYellow, fontSize: 16),
                pickerTextStyle:
                TextStyle(color: AppColors.textYellow, fontSize: 16),
              ),
              brightness: Brightness.dark),
          hintColor: AppColors.textGray,
          textSelectionHandleColor: AppColors.accentColor,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFieldBorder)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFieldBorder)),
            hintStyle: TextStyle(color: AppColors.textGray),
          )),
      initialRoute: PageRoutes.splash,
      routes: _pageMap(),
    );
  }

  _pageMap() {
    return <String, WidgetBuilder>{
      PageRoutes.channelDetail: (BuildContext context) {
        return Container();
      },
      PageRoutes.movieDetail: (BuildContext context) {
        return Container();
      },
      PageRoutes.videoDetail: (BuildContext context) {
        return Container();
      },
      PageRoutes.splash: (BuildContext context) => SplashPage(),
      PageRoutes.main: (BuildContext context) {
        return MainPage();
      },
      PageRoutes.signIn: (BuildContext context) {
        return Container();
      },
      PageRoutes.enterPhoneNumber: (BuildContext context) {
        return Container();
      },
      PageRoutes.otp: (BuildContext context) {
        return Container();
      },
      PageRoutes.createNewPassword: (BuildContext context) {
        return Container();
      },
      PageRoutes.submitProfile: (BuildContext context) {
        return Container();
      },
      PageRoutes.search: (BuildContext context) {
        return Container();
      },
      PageRoutes.qrScanner: (BuildContext context) {
        return QRScannerPage();
      },
      PageRoutes.watchingHistory: (BuildContext context) {
        return Container();
      },
      PageRoutes.favorites: (BuildContext context) {
        return Container();
      },
      PageRoutes.changePassword: (BuildContext context) {
        return Container();
      },
      PageRoutes.loginDevices: (BuildContext context) {
        return Container();
      },
      PageRoutes.aboutUs: (BuildContext context) {
        return Container();
      },
      PageRoutes.agreement: (BuildContext context) {
        return Container();
      },
      PageRoutes.contact: (BuildContext context) {
        return Container();
      },
      PageRoutes.frequentlyQuestions: (BuildContext context) {
        return Container();
      },
      PageRoutes.help: (BuildContext context) {
        return Container();
      },
      PageRoutes.detailIntroduction: (BuildContext context) {
        return Container();
      },
      PageRoutes.policy: (BuildContext context) {
        return Container();
      },
      PageRoutes.support: (BuildContext context) {
        return Container();
      },
      PageRoutes.changeInfoText: (BuildContext context) {
        return Container();
      },
      PageRoutes.videos: (BuildContext context) {
        return Container();
      },
      PageRoutes.movies: (BuildContext context) {
        return Container();
      },

      PageRoutes.channels: (BuildContext context) {
        return Container();
      },
      PageRoutes.actorDetail: (BuildContext context) {
        return Container();
      },
      PageRoutes.searchResults: (BuildContext context) {
        return Container();
      },
    };
  }
}
