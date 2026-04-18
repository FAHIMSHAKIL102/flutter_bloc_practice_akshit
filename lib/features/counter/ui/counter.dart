import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/counterlisten/ui/counterlisten.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  CounterBloc counterBloc = CounterBloc();

  @override
  void initState() {
    counterBloc.add(CounterIncrementEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Counterlisten()),
              );
            },
            icon: Icon(Icons.arrow_outward_outlined),
          ),
        ],
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterIncrementState:
              final successState = state as CounterIncrementState;
              return Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      successState.value.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              );
            default:
              return Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [Text('Not Found', style: TextStyle(fontSize: 50))],
                ),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(CounterIncrementEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
