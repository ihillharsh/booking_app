import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import '../../../core/storage/local_storage.dart';
import '../../../core/config/app_config.dart';

@injectable
class PreferencesDataSource {
  final LocalStorage _localStorage;

  PreferencesDataSource(this._localStorage);

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _localStorage.setString(AppConfig.themeKey, themeMode.name);
  }

  ThemeMode getThemeMode() {
    final themeName = _localStorage.getString(AppConfig.themeKey);
    if (themeName == null) return ThemeMode.system;

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == themeName,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> saveLanguage(String languageCode) async {
    await _localStorage.setString(AppConfig.languageKey, languageCode);
  }

  String getLanguage() {
    return _localStorage.getString(AppConfig.languageKey) ?? 'en';
  }
}
