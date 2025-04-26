import 'package:bloc_example/counter/bloc/counter_bloc.dart';
import 'package:bloc_example/counter/counter_page.dart';
import 'package:bloc_example/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterCubit(),
          ),
          BlocProvider(
            create: (context) => CounterBloc(),
          )
        ],
        child: const CounterPage(title: 'Counter Page'),
      ),
    );
  }
}
