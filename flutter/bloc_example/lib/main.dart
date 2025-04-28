import 'package:bloc_example/bloc/counter/counter_bloc.dart';
import 'package:bloc_example/bloc/theme/theme_cubit.dart';
import 'package:bloc_example/bloc/theme/theme_state.dart';
import 'package:bloc_example/pages/home_page.dart';
import 'package:bloc_example/bloc/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocApp());
}

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BLoC State Management',
            theme: state.theme,
            home: const CounterPage(title: 'BLoC Example'),
          );
        },
      ),
    );
  }
}
