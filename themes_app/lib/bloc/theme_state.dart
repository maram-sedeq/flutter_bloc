part of 'theme_bloc.dart';

@immutable
abstract class ThemeState extends Equatable{
  const ThemeState();

  @override
 List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}

 class LoadThemeState extends ThemeState{
  final ThemeData themeData;

  const new({required this.themeData});
 @override
 List<Object> get props => [themeData];
 }