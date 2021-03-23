import 'package:flutter/material.dart';
import 'package:skeleton_flutter/theme/colors.dart';
import 'package:skeleton_flutter/util/size_config.dart';

class RoundedCornerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  final double widthSize;

  const RoundedCornerButton(
      this.text, {
        Key key,
        this.onPressed,
        this.isActive = false,
        this.widthSize,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize ?? SizeConfig.screenWidth * 0.65,
      height: getProportionateScreenHeight(44),
      child: FlatButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: (isActive) ? AppColors.buttonActiveGradient : AppColors.buttonInActiveGradient,
            borderRadius: const BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColors.textWhite),
            ),
          ),
        ),
      ),
    );
  }
}
