import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/counterconsumer/bloc/counterconsumer_bloc.dart';

class Counterconsumer extends StatefulWidget {
  const Counterconsumer({super.key});

  @override
  State<Counterconsumer> createState() => _CounterconsumerState();
}

class _CounterconsumerState extends State<Counterconsumer> {
  CounterconsumerBloc counterconsumerBloc = CounterconsumerBloc();

  @override
  void initState() {
    counterconsumerBloc.add(CounterconsumerIncrementEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Consumer')),
      body: BlocConsumer<CounterconsumerBloc, CounterconsumerState>(
        bloc: counterconsumerBloc,
        listenWhen: (previous, current) =>
            current is CounterconsumerActionState,
        buildWhen: (previous, current) =>
            current is! CounterconsumerActionState,
        listener: (context, state) {
          if (state is CounterconsumerSnackbarActionState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Snackbar')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterconsumerIncrementState:
              final successState = state as CounterconsumerIncrementState;
              return Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      successState.value.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     counterconsumerBloc.add(
                    //       CounterconsumerIncrementEvent(),
                    //     );
                    //   },
                    //   child: Text('add'),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        counterconsumerBloc.add(CounterconsumerSnackbarEvent());
                      },
                      child: Text('Snackbar'),
                    ),
                  ],
                ),
              );
            default:
              return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterconsumerBloc.add(CounterconsumerIncrementEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
