part of 'switch_theme_cubit.dart';

@immutable
sealed class SwitchThemeState {}

final class SwitchThemeInitial extends SwitchThemeState {}
final class LightTheme extends SwitchThemeState {}
final class DarkTheme extends SwitchThemeState {}
