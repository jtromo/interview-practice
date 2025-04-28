import 'package:flutter/material.dart';
import 'package:provider_example/utils.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData theme;

  ThemeProvider({ThemeData? initialTheme}) {
    if (initialTheme == null) {
      theme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      );
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
