import 'dart:ui';
import 'package:intl/intl.dart';

extension StringExtension on String {
  DateTime get stringToDateTime {
    try {
      return DateTime.parse(this);
    } catch (ex) {
      return null;
    }
  }

  bool isSameDate(DateTime dateTime) {
    DateTime value = this.stringToDateTime;
    DateTime day1 = DateTime(value.year, value.month, value.day);
    DateTime day2 = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return day1.difference(day2).inDays == 0;
  }

  bool isVisibleTypeSales() {
    return (this.isEmpty || this.startsWith('0/') || this.split(' ').first == '0' || (this.split(' ').first == '0.0'));
  }

  String get replaceText {
    return  ( this ?? '').replaceAll(RegExp(r'.[a-z]{2}-[A-Z]{2}$'), '');
  }


  String get convertDateTimeStringLocalToUTC {
    return this == null ? '' : DateTime.parse(this).toUtc().toIso8601String();
  }

  String get convertDateTimeStringServerToLocal {
    if (this == null || this == "") return null;
    try {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(this).toUtc().toLocal().toIso8601String();
    } catch (ex) {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(this).toUtc().toLocal().toIso8601String();
    }
  }

  String get convertDateTimeStringServerUTCToLocal {
    if (this == null || this == "") return null;
    try {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(this, true).toLocal().toIso8601String();
    } catch (ex) {
      return this;
    }
  }


  int get convertToInt {
    if (this == null || this.isEmpty) {
      return 0;
    }
    return int.parse(this);
  }

  double get convertToDouble {
    if (this == null || this.isEmpty) {
      return 0.0;
    }
    return double.parse(this);
  }

  String get formatCurrency {
    if (this == null || this.isEmpty) {
      return '';
    }
    double value = double.parse(this.replaceAll(",", ""));
    final formatter = NumberFormat("#,###");
    return formatter.format(value);
  }

  String get capitalize {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String get hasRoundValue {
    final startIndex = this.indexOf(".");
    var lastLength = this.substring(startIndex, this.length);
    if (this.contains(".0") && lastLength.length != 3) {
      return '${(double.parse(this)).round()} m';
    } else {
      return '${(double.parse(this))} m';
    }
  }

  String get hasRoundValueM2 {
    final startIndex = this.indexOf(".");
    var lastLength = this.substring(startIndex, this.length);
    if (this.contains(".0") && lastLength.length != 3) {
      return '${(double.parse(this)).round()} m2';
    } else {
      return '${(double.parse(this))} m2';
    }
  }

  String get nonUnicode {
    var textNew = this;
    var arr1 = [
      "á",
      "à",
      "ả",
      "ã",
      "ạ",
      "â",
      "ấ",
      "ầ",
      "ẩ",
      "ẫ",
      "ậ",
      "ă",
      "ắ",
      "ằ",
      "ẳ",
      "ẵ",
      "ặ",
      "đ",
      "é",
      "è",
      "ẻ",
      "ẽ",
      "ẹ",
      "ê",
      "ế",
      "ề",
      "ể",
      "ễ",
      "ệ",
      "í",
      "ì",
      "ỉ",
      "ĩ",
      "ị",
      "ó",
      "ò",
      "ỏ",
      "õ",
      "ọ",
      "ô",
      "ố",
      "ồ",
      "ổ",
      "ỗ",
      "ộ",
      "ơ",
      "ớ",
      "ờ",
      "ở",
      "ỡ",
      "ợ",
      "ú",
      "ù",
      "ủ",
      "ũ",
      "ụ",
      "ư",
      "ứ",
      "ừ",
      "ử",
      "ữ",
      "ự",
      "ý",
      "ỳ",
      "ỷ",
      "ỹ",
      "ỵ"
    ];
    var arr2 = [
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "a",
      "d",
      "e",
      "e",
      "e",
      "e",
      "e",
      "e",
      "e",
      "e",
      "e",
      "e",
      "e",
      "i",
      "i",
      "i",
      "i",
      "i",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "o",
      "u",
      "u",
      "u",
      "u",
      "u",
      "u",
      "u",
      "u",
      "u",
      "u",
      "u",
      "y",
      "y",
      "y",
      "y",
      "y"
    ];

    for (int i = 0; i < arr1.length; i++) {
      textNew = textNew.replaceAll(arr1[i], arr2[i]);
      textNew = textNew.replaceAll(arr1[i].toUpperCase(), arr2[i].toUpperCase());
    }
    return textNew;
  }

  bool parseBool() {
    return this.toLowerCase() == "true";
  }

  bool get isOnlyNumber {
    RegExp regex = RegExp(r'^\d*\.?\d*$');
    return regex.hasMatch(this);
  }

  String get toUpperCaseFirst {
    if (this.length > 0) {
      return "${this[0].toUpperCase()}${this.substring(1)}";
    }
    return this;
  }

  String get hidePhoneNumber {
    var phone = this;
    for (int i = 0; i < phone.length - 3; i++) {
      phone = phone.replaceRange(i, i + 1, '*');
    }
    return phone;
  }

  String get onlyMsg => this.replaceAll(RegExp(r'.[a-z]{2}-[A-Z]{2}$'), '');

  String get removeFirstCharacterIsZero => int.parse(this).toString();

  int get toInt {
    if (this == null) return null;
    return int.parse(this);
  }

  bool get isValidEmail {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(this);
  }

  bool get isValidPhone {
    RegExp regex = RegExp(r'(^(?:[+])?[0-9]{10,12}$)');
    return regex.hasMatch(this);
  }
}
