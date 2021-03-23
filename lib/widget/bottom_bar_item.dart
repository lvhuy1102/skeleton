
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skeleton_flutter/theme/colors.dart';
import 'package:skeleton_flutter/util/size_config.dart';

class BottomBarItem extends BottomNavigationBarItem {
  final IconData icons;
  final String text;

  BottomBarItem(this.icons, this.text)
      : super(
    icon: Column(
      children: [
        Container(
          height: getProportionateScreenHeight(3),
          color: Colors.transparent,
        ),
        SizedBox(
            height: getProportionateScreenHeight(30),
            child: Icon(icons,color: Colors.white,),),
      ],
    ),
    activeIcon: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 4, right: 4),
          height: getProportionateScreenHeight(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            color: AppColors.accentColor,
          ),
        ),
        SizedBox(
            height: getProportionateScreenHeight(30),
            child: Icon(icons,color: AppColors.accentColor,)),
      ],
    ),
    label: text
  );
}