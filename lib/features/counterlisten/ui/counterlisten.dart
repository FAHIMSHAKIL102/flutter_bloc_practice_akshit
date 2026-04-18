import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/counterlisten/bloc/counterlisten_bloc.dart';

class Counterlisten extends StatefulWidget {
  const Counterlisten({super.key});

  @override
  State<Counterlisten> createState() => _CounterlistenState();
}

class _CounterlistenState extends State<Counterlisten> {
  CounterlistenBloc counterlistenBloc = CounterlistenBloc();

  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Listen')),
      body: BlocListener<CounterlistenBloc, CounterlistenState>(
        bloc: counterlistenBloc,
        listener: (context, state) {
          if (state is CounterlistenSnackbarActionState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Snacbar')));
          } else if (state is CounterlistenIncrementActionState) {
            setState(() {
              value++;
            });
          }else if (state is CounterlistenNavigationActionState){
            
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(value.toString(), style: TextStyle(fontSize: 50)),
              ElevatedButton(
                onPressed: () {
                  counterlistenBloc.add(CounterlistenSnackbarEvent());
                },
                child: Text('Snacbar'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterlistenBloc.add(CounterlistenIncrementEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
