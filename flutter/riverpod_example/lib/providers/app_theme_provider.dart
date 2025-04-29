import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/utils/constants.dart';
import 'package:riverpod_example/utils/utils.dart';

part 'app_theme_provider.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  @override
  ThemeData build() {
    return defaultTheme;
  }

  void darkTheme() {
    state = defaultDarkTheme;
  }

  void lightTheme() {
    state = defaultLightTheme;
  }

  void systemTheme() {
    state = defaultTheme;
  }

  void randomTheme() {
    state = Utils.generateRandomTheme();
  }
}
