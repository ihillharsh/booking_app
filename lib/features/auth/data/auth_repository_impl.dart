import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/failures.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../core/config/app_config.dart';
import '../domain/entities/user.dart';
import '../domain/auth_repository.dart';
import 'auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final SecureStorage _secureStorage;

  AuthRepositoryImpl(this._remoteDatasource, this._secureStorage);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await _remoteDatasource.login(email, password);
      final user = response.data.toEntity();

      // Save token to secure storage
      await _secureStorage.write(AppConfig.authTokenKey, user.token);

      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _secureStorage.delete(AppConfig.authTokenKey);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final token = await _secureStorage.read(AppConfig.authTokenKey);
      if (token == null) {
        return const Right(null);
      }
      // TODO: Fetch user from API or cache
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
