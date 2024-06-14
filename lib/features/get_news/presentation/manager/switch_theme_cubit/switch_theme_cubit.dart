import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:news_app_with_clean_architecture/features/get_news/data/models/enums/theme_state.dart';
part 'switch_theme_state.dart';

class SwitchThemeCubit extends Cubit<SwitchThemeState> {
  SwitchThemeCubit() : super(SwitchThemeInitial());


  switchTheme(ThemeState themeState) async {
    final cache =CacheHelper();

    switch (themeState) {
      case ThemeState.initial:
        final theme = cache.getDataString(key: 'theme');
      if(theme != null){
          if(cache.getDataString(key: 'theme') == 'light'){
            emit(LightTheme());
          }else{
            emit(DarkTheme());
          }
        }else{
          emit(LightTheme());
        }
        break;
      case ThemeState.light:
        cache.saveData(key: 'theme', value: 'light');
        emit(LightTheme());
        break;
      case ThemeState.dark:
        cache.saveData(key: 'theme', value: 'dark');
        emit(DarkTheme());
        break;
    }
  }
}
