import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  hideKeyboard() {
    FocusScope.of(this).requestFocus(new FocusNode());
  }
}