class Regex {
  Regex._();
  static final decimalRegex = RegExp(r'^\d*\.?\d*$');
  static final decimalWithTwoDigitAfterPointRegex = RegExp(r'^\d*\.?\d{0,2}$');
  static final percentRegex = RegExp(r'^\d{0,2}\.?\d{0,2}$');
}
