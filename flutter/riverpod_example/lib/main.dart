import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/pages/home_page.dart';
import 'package:riverpod_example/providers/app_theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: RiverpodApp()));
}

class RiverpodApp extends ConsumerWidget {
  const RiverpodApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Riverpod State Management',
      theme: ref.watch(appThemeProvider),
      home: const HomePage(title: 'Riverpod Example'),
    );
  }
}
