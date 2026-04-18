part of 'counterlisten_bloc.dart';

@immutable
sealed class CounterlistenState {}

final class CounterlistenInitial extends CounterlistenState {}

abstract class CounterlistenActionState extends CounterlistenState{}

class CounterlistenSnackbarActionState extends CounterlistenActionState{}

class CounterlistenIncrementActionState extends CounterlistenActionState{}

class CounterlistenNavigationActionState extends CounterlistenActionState{}
