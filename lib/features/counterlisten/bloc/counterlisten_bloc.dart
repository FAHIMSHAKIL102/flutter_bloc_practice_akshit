import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counterlisten_event.dart';
part 'counterlisten_state.dart';

class CounterlistenBloc extends Bloc<CounterlistenEvent, CounterlistenState> {
  CounterlistenBloc() : super(CounterlistenInitial()) {
    on<CounterlistenSnackbarEvent>(counterlistenSnackbarEvent);
    on<CounterlistenIncrementEvent>(counterlistenIncrementEvent);
    on<CounterListenNavigationConsumerEvent>(
      counterListenNavigationConsumerEvent,
    );
  }

  FutureOr<void> counterlistenSnackbarEvent(
    CounterlistenSnackbarEvent event,
    Emitter<CounterlistenState> emit,
  ) {
    emit(CounterlistenSnackbarActionState());
  }

  FutureOr<void> counterlistenIncrementEvent(
    CounterlistenIncrementEvent event,
    Emitter<CounterlistenState> emit,
  ) {
    emit(CounterlistenIncrementActionState());
  }

  FutureOr<void> counterListenNavigationConsumerEvent(
    CounterListenNavigationConsumerEvent event,
    Emitter<CounterlistenState> emit,
  ) {
    emit(CounterlistenNavigationActionState());
  }
}
