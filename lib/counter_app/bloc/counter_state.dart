part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class CounterValueState extends CounterState{
  final int counter;

  new({required this.counter});
  
}