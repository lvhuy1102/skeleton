import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MaxValueInputFormatter extends TextInputFormatter {
  final double maxValue;

  MaxValueInputFormatter({this.maxValue});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (maxValue == null || maxValue == 0.0 || newValue.text.length == 0) return newValue;
    if (newValue.text.length > 0 && double.parse(newValue.text) > maxValue) return oldValue;
    return newValue;
  }
}
