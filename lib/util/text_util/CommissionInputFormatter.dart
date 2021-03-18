import 'package:flutter/services.dart';
import 'package:skeleton_flutter/util/regex/regex.dart';

class CommissionInputFormatter extends TextInputFormatter {
  final int decimalRange = 2;
  final regEx = Regex.percentRegex;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    if (newValue.text.contains(',')) {
      newValue = newValue.copyWith(text: newValue.text.replaceAll(',', '.'));
    }
    if (!regEx.hasMatch(newValue.text)) return oldValue;
    if (newValue.text.isEmpty) {
      return newValue;
    } else {
      if (double.parse(newValue.text) >= 100) return oldValue;
    }
    return newValue;
  }
}
