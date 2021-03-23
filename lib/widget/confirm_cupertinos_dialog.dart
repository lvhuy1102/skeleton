import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_flutter/theme/colors.dart';

class ConfirmCupertinoDialog extends CupertinoAlertDialog {
  final String contentMessage;
  final VoidCallback callback;
  final BuildContext context;
  final bool hasOneSelection;
  final VoidCallback cancelCallback;
  final String titleDialog;
  final String negativeButtonContent;
  final String positiveButtonContent;

  ConfirmCupertinoDialog({
    @required this.contentMessage,
    this.callback,
    @required this.context,
    this.hasOneSelection = false,
    this.cancelCallback,
    this.titleDialog,
    this.negativeButtonContent,
    this.positiveButtonContent,
  }) : super(
    title: Text(
      titleDialog ?? "Thông báo",
      style: Theme.of(context).textTheme.headline6.copyWith(color: AppColors.textWhite, fontSize: 18),
    ),
    content: Text(
      contentMessage,
      style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColors.textWhite),
    ),
    actions: listAction(hasOneSelection, context, callback, cancelCallback, negativeButtonContent, positiveButtonContent),
  );

  static List<Widget> listAction(bool hasOneSelection, BuildContext context, VoidCallback callback, VoidCallback cancelCallback, String negativeButtonContent,
      String positiveButtonContent) {
    final Widget accept = CupertinoDialogAction(
      onPressed: () async {
        Navigator.of(context).pop();
        callback();
      },
      isDefaultAction: true,
      child: Text(
        positiveButtonContent ?? "Đồng ý",
        style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColors.accentColor),
      ),
    );
    if (hasOneSelection) {
      return [accept];
    } else {
      return [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            if (cancelCallback != null) {
              cancelCallback();
            }
          },
          isDefaultAction: false,
          child: Text(
            negativeButtonContent ?? "Hủy bỏ",
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColors.accentColor),
          ),
        ),
        accept
      ];
    }
  }
}
