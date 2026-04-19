part of 'counterconsumer_bloc.dart';

@immutable
sealed class CounterconsumerEvent {}

class CounterconsumerIncrementEvent extends CounterconsumerEvent{}

class CounterconsumerSnackbarEvent extends CounterconsumerEvent{}
