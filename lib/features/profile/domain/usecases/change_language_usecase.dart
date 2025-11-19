import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../preferences_repository.dart';

@injectable
class ChangeLanguageUseCase {
  final PreferencesRepository _repository;

  ChangeLanguageUseCase(this._repository);

  Future<Either<Failure, void>> call(String languageCode) {
    return _repository.saveLanguage(languageCode);
  }
}
