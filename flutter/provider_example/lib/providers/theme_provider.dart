import 'package:flutter/material.dart';
import 'package:provider_example/utils/constants.dart';
import 'package:provider_example/utils/utils.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData theme;

  ThemeProvider({ThemeData? initialTheme}) {
    if (initialTheme == null) {
      theme = defaultTheme;
    } else {
      theme = initialTheme;
    }
  }

  void changeTheme(ThemeData newTheme) {
    theme = newTheme;
    notifyListeners();
  }

  void randomTheme() {
    theme = Utils.generateRandomTheme();
    notifyListeners();
  }
}
