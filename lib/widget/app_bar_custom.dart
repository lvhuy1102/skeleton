import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeleton_flutter/theme/colors.dart';

AppBar buildAppBar(BuildContext context, {@required String title}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.toolbarBackground,
    title: Text(
      title ?? "",
      style: Theme.of(context).textTheme.headline6.copyWith(color: AppColors.textWhite),
    ),
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }),
  );
}
