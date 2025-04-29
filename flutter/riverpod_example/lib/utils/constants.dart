import 'package:flutter/material.dart';

const defaultSeedColor = Colors.orange;

final defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: defaultSeedColor),
  useMaterial3: true,
);

final defaultDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(seedColor: defaultSeedColor),
  useMaterial3: true,
);

final defaultLightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: defaultSeedColor),
  useMaterial3: true,
);
