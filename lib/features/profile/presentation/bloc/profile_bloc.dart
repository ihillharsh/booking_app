import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/preferences_repository.dart';
import '../../domain/usecases/change_theme_usecase.dart';
import '../../domain/usecases/change_language_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final PreferencesRepository _preferencesRepository;
  final ChangeThemeUseCase _changeThemeUseCase;
  final ChangeLanguageUseCase _changeLanguageUseCase;

  ProfileBloc(
    this._preferencesRepository,
    this._changeThemeUseCase,
    this._changeLanguageUseCase,
  ) : super(const ProfileState()) {
    on<LoadProfile>(_onLoadProfile);
    on<ThemeChanged>(_onThemeChanged);
    on<LanguageChanged>(_onLanguageChanged);
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    final themeResult = _preferencesRepository.getThemeMode();
    final languageResult = _preferencesRepository.getLanguage();

    themeResult.fold(
      (failure) => null,
      (themeMode) {
        languageResult.fold(
          (failure) => null,
          (languageCode) {
            emit(state.copyWith(
              themeMode: themeMode,
              languageCode: languageCode,
            ));
          },
        );
      },
    );
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<ProfileState> emit,
  ) async {
    await _changeThemeUseCase(event.themeMode);
    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onLanguageChanged(
    LanguageChanged event,
    Emitter<ProfileState> emit,
  ) async {
    await _changeLanguageUseCase(event.languageCode);
    emit(state.copyWith(languageCode: event.languageCode));
  }
}
