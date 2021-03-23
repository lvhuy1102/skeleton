import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skeleton_flutter/keys.dart';
import 'package:skeleton_flutter/res.dart';
import 'package:skeleton_flutter/router/router_path.dart';
import 'package:skeleton_flutter/theme/colors.dart';
import 'package:skeleton_flutter/theme/style.dart';
import 'package:skeleton_flutter/ui/main/tabs/home/home_page.dart';
import 'package:skeleton_flutter/ui/main/tabs/mores/more_page.dart';
import 'package:skeleton_flutter/ui/main/tabs/movies/movies_page.dart';
import 'package:skeleton_flutter/ui/main/tabs/news/new_tab.dart';
import 'package:skeleton_flutter/util/size_config.dart';
import 'package:skeleton_flutter/widget/bottom_bar_item.dart';
import 'package:skeleton_flutter/widget/confirm_cupertinos_dialog.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static GlobalKey bottomBar = GlobalKey();
  var _currentIndex = 0;
  final _keys = [AppKeys.homeTab, AppKeys.newsTab, AppKeys.movieTab, AppKeys.moreTab];
  List<Widget> _tabs;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [HomeTab(), NewsTab(), MovieTab(), MoreTab()];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SizeConfig.bottomNavHeight = bottomBar.currentContext.size.height;
    });

  }


  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarOpacity: 0,
      title: Image.asset(
        Res.logo_newyear,
        width: 150,
        fit: BoxFit.cover,
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset(Res.ic_search),
            onPressed: () {
              Navigator.pushNamed(context, PageRoutes.search);
            }),
        IconButton(
            icon: SvgPicture.asset(Res.ic_scan_qrcode),
            onPressed: () async {
              final result = await Permission.camera.request();
              if (result.isGranted) {
                Navigator.pushNamed(context, PageRoutes.qrScanner);
              } else {
                await openAppSettings();
                if (await Permission.camera.request().isGranted) {
                  Navigator.pushNamed(context, PageRoutes.qrScanner);
                }
              }
            }),
      ],
    );
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          bool exitApp = false;
          await showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => ConfirmCupertinoDialog(
                context: context,
                contentMessage: "Thoát khỏi ứng dụng?",
                callback: () async {
                  exitApp = true;
                },
              ));
          return exitApp;
        }
        return true;
      },
      child: Container(
          decoration: const BoxDecoration(gradient: RadialGradient(center: Alignment.topRight, radius: 1.2, colors: [AppColors.startBackgroundHomeGradient, AppColors.endBackgroundHomeGradient])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: IndexedStack(
              index: _currentIndex,
              children: _tabs,
            ),
            bottomNavigationBar: Theme(
              data: ThemeData(
                accentColor: AppColors.accentColor,
                textTheme: AppStyles.textTheme,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                key: bottomBar,
                items: [
                  BottomBarItem(LineIcons.home, "Trang chủ"),
                  BottomBarItem(LineIcons.newspaper, "Tin tức"),
                  BottomBarItem(LineIcons.video, "Videos"),
                  BottomBarItem(LineIcons.horizontalEllipsis, "Thêm"),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                currentIndex: _currentIndex,
                selectedFontSize: 12.0,
                unselectedFontSize: 12.0,
                fixedColor: AppColors.accentColor,
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.bottomNavigationBackground,
              ),
            ),
          ),
        ),
    );
  }
}
