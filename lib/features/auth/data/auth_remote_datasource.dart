import 'package:injectable/injectable.dart';
import '../../../core/network/api_response.dart';
import '../../../core/utils/constants.dart';
import 'models/user_model.dart';

@injectable
class AuthRemoteDatasource {
  AuthRemoteDatasource();

  Future<ApiResponse<UserModel>> login(String email, String password) async {
    try {
      // TODO: Replace with real API call when backend is ready
      // final response = await _dio.post('/auth/login', data: {
      //   'email': email,
      //   'password': password,
      // });

      // MOCK: Simulate API delay
      await Future.delayed(AppConstants.mockApiDelay);

      // MOCK: Return fake response with real API structure
      final mockResponse = {
        'statusCode': 200,
        'success': true,
        'message': 'Login successful',
        'data': {
          'id': 'user_${DateTime.now().millisecondsSinceEpoch}',
          'email': email,
          'name': email.split('@')[0].toUpperCase(),
          'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
        }
      };

      return ApiResponse<UserModel>.fromJson(
        mockResponse,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }
}
