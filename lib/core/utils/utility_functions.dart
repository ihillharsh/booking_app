import 'package:flutter/material.dart';

class UtilityFunctions {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.unfocus();
    }

    FocusManager.instance.primaryFocus?.unfocus();
  }
}
