part of 'internet_cubit.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}


class ConnectedState extends InternetState{
  final String message;

  new({required this.message});

}
class NotConnectedState extends InternetState{
  final String message;

  new({required this.message});

}