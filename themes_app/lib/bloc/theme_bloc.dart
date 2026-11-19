import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:themes_app/app_theme.dart';
import 'package:themes_app/theme_cache_helper.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if(event is GetCurrentThemeEvent) {
        final themeIndex = await ThemeCacheHelper().getCachedThemeIndex();
        final theme = AppTheme.values.firstWhere((appTheme) => appTheme.index == themeIndex);
        emit(LoadThemeState(themeData: appThemeData[theme]!));
      }
      else if(event is ThemeChangeEvent){
      final themeIndex = event.theme.index;
      await ThemeCacheHelper().cacheThemeIndex(themeIndex);
      emit(LoadThemeState(themeData: appThemeData[event.theme]!));
      }
      else{

      }
    });
  }
}
