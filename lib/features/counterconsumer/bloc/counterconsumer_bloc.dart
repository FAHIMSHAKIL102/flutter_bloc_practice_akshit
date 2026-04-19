import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counterconsumer_event.dart';
part 'counterconsumer_state.dart';

class CounterconsumerBloc
    extends Bloc<CounterconsumerEvent, CounterconsumerState> {
  CounterconsumerBloc() : super(CounterconsumerInitial()) {
    on<CounterconsumerIncrementEvent>(counterconsumerIncrementEvent);
    on<CounterconsumerSnackbarEvent>(counterconsumerSnackbarEvent);
  }

  int value = 0;
  FutureOr<void> counterconsumerIncrementEvent(
    CounterconsumerIncrementEvent event,
    Emitter<CounterconsumerState> emit,
  ) {
    value++;
    emit(CounterconsumerIncrementState(value: value));
  }

  FutureOr<void> counterconsumerSnackbarEvent(
    CounterconsumerSnackbarEvent event,
    Emitter<CounterconsumerState> emit,
  ) {
    emit(CounterconsumerSnackbarActionState());
  }
}
