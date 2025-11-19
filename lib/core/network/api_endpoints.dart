import '../config/app_config.dart';

class ApiEndpoints {
  static const String baseUrl = AppConfig.baseUrl;

  // Auth Endpoints
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String register = '/auth/register';

  // User Endpoints
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/update';
}
