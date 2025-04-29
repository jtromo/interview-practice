import 'package:bloc_example/bloc/counter/counter_bloc.dart';
import 'package:bloc_example/bloc/counter/counter_state.dart';
import 'package:bloc_example/bloc/counter/counter_cubit.dart';
import 'package:bloc_example/bloc/theme/theme_cubit.dart';
import 'package:bloc_example/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _stateCount;
  late CounterBloc _counterBloc;
  late int _blocCount;
  late CounterCubit _counterCubit;
  late int _cubitCount;
  late ThemeCubit _themeCubit;

  final _stateManagerOptions = <StateManager>[StateManager.state, StateManager.bloc, StateManager.cubit];
  var _selectedStateManager = StateManager.state;

  void _incrementCounter() {
    switch (_selectedStateManager) {
      case StateManager.state:
        setState(() {
          _stateCount++;
        });
        break;
      case StateManager.bloc:
        _counterBloc.add(CounterIncrementPressed());
        break;
      case StateManager.cubit:
        _counterCubit.increment();
        break;
    }
  }

  void _decrementCounter() {
    switch (_selectedStateManager) {
      case StateManager.state:
        setState(() {
          _stateCount--;
        });
        break;
      case StateManager.bloc:
        _counterBloc.add(CounterDecrementPressed());
        break;
      case StateManager.cubit:
        _counterCubit.decrement();
        break;
    }
  }

  void _resetCounter() {
    switch (_selectedStateManager) {
      case StateManager.state:
        setState(() {
          _stateCount = 0;
        });
        break;
      case StateManager.bloc:
        _counterBloc.add(CounterResetPressed());
        break;
      case StateManager.cubit:
        _counterCubit.reset();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _counterBloc = context.read<CounterBloc>();
    _counterCubit = context.read<CounterCubit>();
    _themeCubit = context.read<ThemeCubit>();
    _stateCount = 0;
    _blocCount = 0;
    _cubitCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              setState(() {
                _blocCount = state.count;
              });
            },
          ),
          BlocListener<CounterCubit, CounterState>(
            listener: (context, state) {
              setState(() {
                _cubitCount = state.count;
              });
            },
          ),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                value: _selectedStateManager,
                items: _stateManagerOptions.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedStateManager = value;
                  });
                },
              ),
              Text(
                'Selected State Manager: ${_selectedStateManager.toString()}',
              ),
              const Text(
                'Buttons pressed per State Manager:',
              ),
              Text(
                'State: $_stateCount',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'BLoC: $_blocCount',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Cubit: $_cubitCount',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _resetCounter,
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _themeCubit.randomTheme,
            tooltip: 'Random Theme',
            child: const Icon(Icons.palette),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
