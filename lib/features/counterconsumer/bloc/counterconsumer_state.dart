part of 'counterconsumer_bloc.dart';

@immutable
sealed class CounterconsumerState {}

abstract class CounterconsumerActionState extends CounterconsumerState {}

final class CounterconsumerInitial extends CounterconsumerState {}

class CounterconsumerIncrementState extends CounterconsumerState {
  final int value;

  CounterconsumerIncrementState({required this.value});
}

class CounterconsumerSnackbarActionState extends CounterconsumerActionState {}
