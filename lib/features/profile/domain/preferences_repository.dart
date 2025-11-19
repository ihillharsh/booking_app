import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../core/errors/failures.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, void>> saveThemeMode(ThemeMode themeMode);
  Either<Failure, ThemeMode> getThemeMode();
  Future<Either<Failure, void>> saveLanguage(String languageCode);
  Either<Failure, String> getLanguage();
}
