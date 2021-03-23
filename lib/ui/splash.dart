import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeleton_flutter/res.dart';
import 'package:skeleton_flutter/router/router_path.dart';
import 'package:skeleton_flutter/util/size_config.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-2, 0.0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigate();
      }
    });
  }



  _navigate() {
    try {
      Navigator.pushReplacementNamed(context, PageRoutes.main);
    } catch (e) {
      debugPrint("_navigate =====$e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Res.bg_splash), fit: BoxFit.cover)),
            child:  Align(
                    alignment: Alignment.center,
                    child: SlideTransition(
                      position: _offsetAnimation,
                      child: Image.asset(
                        Res.logo_newyear,
                        width: SizeConfig.screenWidth / 2,
                      ),
                    ),
                  )
              ));
  }
}
