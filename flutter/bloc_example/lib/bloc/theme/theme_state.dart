import 'package:flutter/material.dart';

var defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
  useMaterial3: true,
);

@immutable
sealed class ThemeState {
  late final ThemeData theme;

  ThemeState({ThemeData? theme}) {
    if (theme == null) {
      this.theme = defaultTheme;
    } else {
      this.theme = theme;
    }
  }
}

final class ThemeInitial extends ThemeState {
  ThemeInitial();
}

final class ThemeStateUpdated extends ThemeState {
  ThemeStateUpdated({required super.theme});
}
