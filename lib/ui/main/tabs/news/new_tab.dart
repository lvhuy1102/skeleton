import 'package:flutter/material.dart';
import 'package:skeleton_flutter/theme/colors.dart';
import 'package:skeleton_flutter/util/size_config.dart';

class NewsTab extends StatelessWidget {
  NewsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.appBarHeight = Scaffold.of(context).appBarMaxHeight + MediaQuery.of(context).padding.top;
    return  DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(gradient: AppColors.mainTabGradient),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
                child: Text(
                  "Tin tức mới nhất",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              )),
          const VerticalSpacing(7),
          Expanded(
            child: Container(child: Text("hello"),),
          ),
        ],
      ),
    );
  }
}