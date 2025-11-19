import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/failures.dart';
import '../domain/preferences_repository.dart';
import 'preferences_datasource.dart';

@LazySingleton(as: PreferencesRepository)
class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesDataSource _dataSource;

  PreferencesRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> saveThemeMode(ThemeMode themeMode) async {
    try {
      await _dataSource.saveThemeMode(themeMode);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Either<Failure, ThemeMode> getThemeMode() {
    try {
      final themeMode = _dataSource.getThemeMode();
      return Right(themeMode);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveLanguage(String languageCode) async {
    try {
      await _dataSource.saveLanguage(languageCode);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Either<Failure, String> getLanguage() {
    try {
      final language = _dataSource.getLanguage();
      return Right(language);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
