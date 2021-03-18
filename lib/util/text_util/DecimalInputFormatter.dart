import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:skeleton_flutter/util/regex/regex.dart';

class DecimalGreaterThanOrEqualOneInputFormatter extends TextInputFormatter {
  final int maxValue;
  final regEx = Regex.decimalWithTwoDigitAfterPointRegex;

  DecimalGreaterThanOrEqualOneInputFormatter({
    this.maxValue,
  }) : assert(maxValue != null && maxValue > 0);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    if (newValue.text.length == 1 && (newValue.text == '.' || newValue.text == ',' || newValue.text == '0')) return oldValue;
    if (newValue.text.contains(',')) {
      newValue = newValue.copyWith(text: newValue.text.replaceAll(',', '.'));
    }
    if (newValue.text.length == 1 && newValue.text == '0') return oldValue;
    if (!regEx.hasMatch(newValue.text)) return oldValue;
    if (newValue.text.isEmpty) {
      return newValue;
    } else {
      if (double.parse(newValue.text) >= maxValue) return oldValue;
    }
    return newValue;
  }
}
