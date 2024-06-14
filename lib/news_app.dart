import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/config/themes/dark_theme.dart';
import 'package:news_app_with_clean_architecture/config/themes/light_theme.dart';
import 'package:news_app_with_clean_architecture/features/get_news/presentation/pages/news_screen.dart';
import 'config/routes/app_routes.dart';
import 'features/get_news/data/models/enums/theme_state.dart';
import 'features/get_news/presentation/manager/get_news_cubit/get_news_cubit.dart';
import 'features/get_news/presentation/manager/switch_theme_cubit/switch_theme_cubit.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchThemeCubit()..switchTheme(ThemeState.initial),
      child: BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
        builder: (context, state) {
           if (state is DarkTheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: appRoutes,
              theme: darkTheme,
              home: MultiBlocProvider(providers: [
                BlocProvider(create: (context) => GetNewsCubit()..getNews()),
              ], child: const NewsScreen()),
            );
          }
           else {
             return MaterialApp(
               debugShowCheckedModeBanner: false,
               routes: appRoutes,
               theme: lightTheme,
               home: MultiBlocProvider(providers: [
                 BlocProvider(create: (context) => GetNewsCubit()..getNews()),
               ], child: const NewsScreen()),
             );
           }
        }
      ),
    );
  }
}
