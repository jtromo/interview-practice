import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/pages/home_page.dart';
import 'package:provider_example/providers/theme_provider.dart';
import 'package:provider_example/providers/counter_provider.dart';

void main() {
  runApp(const ProviderApp());
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: Consumer<ThemeProvider>(builder: (context, colorProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider State Management',
            theme: colorProvider.theme,
            home: const HomePage(title: 'Provider Example'),
          );
        }));
  }
}
