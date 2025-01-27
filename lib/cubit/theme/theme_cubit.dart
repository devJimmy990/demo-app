import 'package:demo_app/core/shared_preferences.dart';
import 'package:demo_app/cubit/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool isDark = false;

  ThemeCubit() : super(InitThemeState());

  void loadTheme() {
    emit(ThemeLoading());
    try {
      String? theme = SharedPreference.getString(key: "theme");
      isDark = theme == "dark";
      emit(ThemeLoaded(theme: currentTheme));
    } catch (e) {
      emit(ThemeError(error: e.toString()));
    }
  }

  void toggleTheme() {
    emit(ThemeLoading());
    try {
      isDark = !isDark;
      emit(ToggleThemeState(theme: currentTheme));
    } catch (e) {
      emit(ThemeError(error: e.toString()));
    }
  }

  ThemeData get currentTheme => isDark ? ThemeData.dark() : ThemeData.light();
}
