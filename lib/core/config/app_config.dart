class AppConfig {
  // API Configuration (for future use)
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = 'v1';

  // App Configuration
  static const String appName = 'My App';
  static const int apiTimeout = 30; // seconds

  // Feature Flags
  static const bool useMockData = true; // Switch to false for real API

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language_code';
}
