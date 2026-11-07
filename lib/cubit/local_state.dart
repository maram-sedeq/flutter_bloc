part of 'local_cubit.dart';

@immutable
sealed class LocalState {
  get locale => null;
}

final class LocalInitial extends LocalState {
}

class ChangedLocalState extends LocalState{
  final Locale locale;

  new({required this.locale});
   
}

