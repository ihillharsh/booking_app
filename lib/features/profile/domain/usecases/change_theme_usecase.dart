import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../preferences_repository.dart';

@injectable
class ChangeThemeUseCase {
  final PreferencesRepository _repository;

  ChangeThemeUseCase(this._repository);

  Future<Either<Failure, void>> call(ThemeMode themeMode) {
    return _repository.saveThemeMode(themeMode);
  }
}
