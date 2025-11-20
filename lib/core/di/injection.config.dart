// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_initial_structure/core/storage/local_storage.dart'
    as _i1031;
import 'package:app_initial_structure/core/storage/secure_storage.dart'
    as _i668;
import 'package:app_initial_structure/features/auth/data/auth_remote_datasource.dart'
    as _i736;
import 'package:app_initial_structure/features/auth/data/auth_repository_impl.dart'
    as _i857;
import 'package:app_initial_structure/features/auth/domain/auth_repository.dart'
    as _i220;
import 'package:app_initial_structure/features/auth/domain/usecases/login_usecase.dart'
    as _i1022;
import 'package:app_initial_structure/features/auth/domain/usecases/logout_usecase.dart'
    as _i354;
import 'package:app_initial_structure/features/auth/presentation/bloc/auth_bloc.dart'
    as _i283;
import 'package:app_initial_structure/features/favourite/bloc/favourite_bloc.dart'
    as _i1049;
import 'package:app_initial_structure/features/home/bloc/home_bloc.dart'
    as _i634;
import 'package:app_initial_structure/features/main/bloc/navigation_bloc.dart'
    as _i287;
import 'package:app_initial_structure/features/profile/data/preferences_datasource.dart'
    as _i304;
import 'package:app_initial_structure/features/profile/data/preferences_repository_impl.dart'
    as _i447;
import 'package:app_initial_structure/features/profile/domain/preferences_repository.dart'
    as _i434;
import 'package:app_initial_structure/features/profile/domain/usecases/change_language_usecase.dart'
    as _i743;
import 'package:app_initial_structure/features/profile/domain/usecases/change_theme_usecase.dart'
    as _i319;
import 'package:app_initial_structure/features/profile/presentation/bloc/profile_bloc.dart'
    as _i788;
import 'package:app_initial_structure/features/restaurant_details/bloc/restaurant_details_bloc.dart'
    as _i599;
import 'package:app_initial_structure/features/salon_booking/bloc/salon_booking_bloc.dart'
    as _i828;
import 'package:app_initial_structure/features/salon_details/bloc/salon_details_bloc.dart'
    as _i83;
import 'package:app_initial_structure/features/search/bloc/search_bloc.dart'
    as _i725;
import 'package:app_initial_structure/features/settings/bloc/settings_bloc.dart'
    as _i131;
import 'package:app_initial_structure/features/splash/bloc/splash_bloc.dart'
    as _i129;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i131.SettingsBloc>(() => _i131.SettingsBloc());
    gh.factory<_i634.HomeBloc>(() => _i634.HomeBloc());
    gh.factory<_i736.AuthRemoteDatasource>(() => _i736.AuthRemoteDatasource());
    gh.factory<_i1049.FavouriteBloc>(() => _i1049.FavouriteBloc());
    gh.factory<_i287.NavigationBloc>(() => _i287.NavigationBloc());
    gh.factory<_i83.SalonDetailsBloc>(() => _i83.SalonDetailsBloc());
    gh.factory<_i599.RestaurantDetailsBloc>(
        () => _i599.RestaurantDetailsBloc());
    gh.factory<_i828.SalonBookingBloc>(() => _i828.SalonBookingBloc());
    gh.lazySingleton<_i220.AuthRepository>(() => _i857.AuthRepositoryImpl(
          gh<_i736.AuthRemoteDatasource>(),
          gh<_i668.SecureStorage>(),
        ));
    gh.factory<_i304.PreferencesDataSource>(
        () => _i304.PreferencesDataSource(gh<_i1031.LocalStorage>()));
    gh.factory<_i129.SplashBloc>(
        () => _i129.SplashBloc(gh<_i668.SecureStorage>()));
    gh.factory<_i1022.LoginUseCase>(
        () => _i1022.LoginUseCase(gh<_i220.AuthRepository>()));
    gh.factory<_i354.LogoutUseCase>(
        () => _i354.LogoutUseCase(gh<_i220.AuthRepository>()));
    gh.factory<_i725.SearchBloc>(
        () => _i725.SearchBloc(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i434.PreferencesRepository>(() =>
        _i447.PreferencesRepositoryImpl(gh<_i304.PreferencesDataSource>()));
    gh.factory<_i743.ChangeLanguageUseCase>(
        () => _i743.ChangeLanguageUseCase(gh<_i434.PreferencesRepository>()));
    gh.factory<_i319.ChangeThemeUseCase>(
        () => _i319.ChangeThemeUseCase(gh<_i434.PreferencesRepository>()));
    gh.factory<_i283.AuthBloc>(() => _i283.AuthBloc(
          gh<_i1022.LoginUseCase>(),
          gh<_i354.LogoutUseCase>(),
        ));
    gh.factory<_i788.ProfileBloc>(() => _i788.ProfileBloc(
          gh<_i434.PreferencesRepository>(),
          gh<_i319.ChangeThemeUseCase>(),
          gh<_i743.ChangeLanguageUseCase>(),
        ));
    return this;
  }
}
