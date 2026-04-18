part of 'counterlisten_bloc.dart';

@immutable
sealed class CounterlistenEvent {}

class CounterlistenSnackbarEvent extends CounterlistenEvent{}

class CounterlistenIncrementEvent extends CounterlistenEvent{}

class CounterListenNavigationConsumerEvent extends CounterlistenEvent{}