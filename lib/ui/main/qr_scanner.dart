import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:skeleton_flutter/theme/colors.dart';
import 'package:skeleton_flutter/util/size_config.dart';
import 'package:skeleton_flutter/widget/app_bar_custom.dart';
import 'package:skeleton_flutter/widget/rounder_concert_button.dart';
import 'package:vibration/vibration.dart';


class QRScannerPage extends StatefulWidget {
  QRScannerPage({Key key}) : super(key: key);

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context, title: "Quét QR"),
      body:  Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                _onQRViewCreated(controller, context);
              },
              overlay: QrScannerOverlayShape(
                borderColor: AppColors.accentColor,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: SizeConfig.screenWidth * 0.8,
              ),
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenWidth + getProportionateScreenHeight(20)),
                    child: Text("Di chuyển camera đến vùng chứa \nmã QR để quét",
                        textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColors.textWhite)),
                  )),
            )
          ],
        ),
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      Future.delayed(Duration.zero, () async {
        if (await Vibration.hasVibrator()) {
          controller.pauseCamera();
          Vibration.vibrate(duration: 500);
          await showCupertinoModalPopup(
              context: context,
              useRootNavigator: false,
              builder: (_) => Container(
                color: AppColors.bgBottomSheet,
                height: SizeConfig.screenHeight * 0.4,
                width: SizeConfig.screenWidth,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.tv,
                        size: getProportionateScreenHeight(100),
                        color: AppColors.backgroundGray,
                      ),
                      Text(
                        "Bạn có muốn đăng nhập vào thiết bị này không?",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColors.textGray),
                      ),
                      const VerticalSpacing(20),
                      RoundedCornerButton(
                        "Đăng nhập",
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        isActive: true,
                      ),
                      const VerticalSpacing(20),
                      RoundedCornerButton(
                        "Hủy",
                        onPressed: () {
                          Navigator.of(context).pop();
                          controller.resumeCamera();
                        },
                        isActive: true,
                      ),
                    ],
                  ),
                ),
              ));
          controller.resumeCamera();
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
