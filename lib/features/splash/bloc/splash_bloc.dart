import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../core/config/app_config.dart';
import 'splash_event.dart';
import 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SecureStorage _secureStorage;

  SplashBloc(this._secureStorage) : super(const SplashInitial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashLoading());

    // Simulate splash delay
    await Future.delayed(const Duration(seconds: 2));

    // Check if user has auth token
    final token = await _secureStorage.read(AppConfig.authTokenKey);

    if (token != null && token.isNotEmpty) {
      emit(const Authenticated());
    } else {
      emit(const Unauthenticated());
    }
  }
}
