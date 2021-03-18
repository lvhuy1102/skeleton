import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeleton_flutter/theme/colors.dart';

class StrokeButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final VoidCallback pressed;

  const StrokeButton({Key key, @required this.label, this.width, this.height, this.pressed})
      : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 40.0,
      child: OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textColor: AppColors.blueTextColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
        borderSide: BorderSide(color: AppColors.blueTextColor, style: BorderStyle.solid),
        onPressed: () {
          pressed?.call();
        },
      ),
    );
  }
}
