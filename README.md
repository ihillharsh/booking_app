# Flutter App - Scalable Architecture Guide

A production-ready Flutter application with Clean Architecture, BLoC state management, multi-language support, and theme switching.

## 📁 Project Structure

```
lib/
├── core/                           # Core functionality (shared across app)
│   ├── config/
│   │   ├── app_config.dart        # App configuration constants
│   │   └── router/
│   │       ├── app_router.dart    # AutoRoute configuration
│   │       └── app_router.gr.dart # Generated routes (auto-generated)
│   │
│   ├── theme/                      # Theme system
│   │   ├── app_theme.dart         # Light & Dark themes
│   │   ├── app_colors.dart        # Color palette
│   │   ├── app_text_styles.dart   # Typography
│   │   └── app_dimensions.dart    # Spacing, sizes
│   │
│   ├── l10n/                       # Localization files
│   │   ├── app_en.arb             # English translations
│   │   ├── app_hi.arb             # Hindi translations
│   │   └── app_gu.arb             # Gujarati translations
│   │
│   ├── utils/                      # Utilities
│   │   ├── validators.dart        # Form validators
│   │   ├── constants.dart         # App constants
│   │   └── extensions/            # Dart extensions
│   │       ├── context_extensions.dart
│   │       └── string_extensions.dart
│   │
│   ├── widgets/                    # Reusable widgets
│   │   ├── buttons/
│   │   │   └── primary_button.dart
│   │   ├── inputs/
│   │   │   └── custom_text_field.dart
│   │   └── feedback/
│   │       └── loading_widget.dart
│   │
│   ├── network/                    # API layer
│   │   ├── api_client.dart        # Dio HTTP client
│   │   ├── api_endpoints.dart     # API URLs
│   │   ├── api_response.dart      # Response wrapper
│   │   └── network_exceptions.dart
│   │
│   ├── storage/                    # Storage wrappers
│   │   ├── local_storage.dart     # SharedPreferences wrapper
│   │   └── secure_storage.dart    # Secure storage wrapper
│   │
│   ├── errors/                     # Error handling
│   │   └── failures.dart          # Failure classes
│   │
│   └── di/                         # Dependency Injection
│       ├── injection.dart         # GetIt setup
│       └── injection.config.dart  # Generated DI (auto-generated)
│
├── features/                       # Feature modules
│   ├── splash/                    # Splash screen feature
│   │   ├── splash_page.dart
│   │   └── bloc/
│   │       ├── splash_bloc.dart
│   │       ├── splash_event.dart
│   │       └── splash_state.dart
│   │
│   ├── auth/                      # Authentication feature
│   │   ├── data/
│   │   │   ├── auth_repository_impl.dart
│   │   │   ├── auth_remote_datasource.dart
│   │   │   └── models/
│   │   │       └── user_model.dart
│   │   ├── domain/
│   │   │   ├── auth_repository.dart
│   │   │   ├── entities/
│   │   │   │   └── user.dart
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart
│   │   │       └── logout_usecase.dart
│   │   └── presentation/
│   │       ├── login_page.dart
│   │       └── bloc/
│   │           ├── auth_bloc.dart
│   │           ├── auth_event.dart
│   │           └── auth_state.dart
│   │
│   ├── main/                      # Main navigation
│   ├── home/                      # Home feature
│   ├── favourite/                 # Favourite feature
│   ├── settings/                  # Settings feature
│   └── profile/                   # Profile feature
│
└── main.dart                      # App entry point
```

## 🏗️ Architecture Explanation

### Feature Structure

Each feature follows **Clean Architecture** with 3 layers:

1. **Data Layer** (`data/`)
   - Models (JSON serialization)
   - Datasources (API calls, local storage)
   - Repository implementations

2. **Domain Layer** (`domain/`)
   - Entities (pure Dart classes)
   - Repository interfaces
   - Use cases (business logic)

3. **Presentation Layer** (`presentation/`)
   - Pages (UI screens)
   - BLoC (state management)
   - Widgets (UI components)

### Why This Structure?

- ✅ **Scalable**: Easy to add new features
- ✅ **Testable**: Each layer can be tested independently
- ✅ **Maintainable**: Clear separation of concerns
- ✅ **Team-friendly**: Multiple developers can work in parallel

---

## 🌍 Adding Multi-Language Support

### Step 1: Add New Language File

Create a new ARB file in `lib/core/l10n/`:

```bash
# Example: Adding Spanish
touch lib/core/l10n/app_es.arb
```

### Step 2: Copy Keys from English

Copy all keys from `app_en.arb` and translate values:

```json
{
  "@@locale": "es",
  "appName": "Mi Aplicación",
  "welcome": "Bienvenido",
  "login": "Iniciar sesión",
  "email": "Correo electrónico",
  "password": "Contraseña",
  "home": "Inicio",
  "profile": "Perfil"
}
```

### Step 3: Generate Localization Files

```bash
flutter gen-l10n
```

### Step 4: Add Locale to App

Update `lib/main.dart`:

```dart
supportedLocales: const [
  Locale('en'),
  Locale('hi'),
  Locale('gu'),
  Locale('es'),  // Add new locale
]
```

### Step 5: Use in UI

```dart
import 'package:app_initial_structure/core/l10n/app_localizations.dart';

// In your widget:
final l10n = AppLocalizations.of(context)!;

Text(l10n.welcome)  // Automatically shows translated text
```

### Adding New Translatable Text

1. **Add to all ARB files** (`app_en.arb`, `app_hi.arb`, `app_gu.arb`):

```json
// app_en.arb
{
  "myNewText": "Hello World"
}

// app_hi.arb
{
  "myNewText": "नमस्ते दुनिया"
}

// app_gu.arb
{
  "myNewText": "હેલો વર્લ્ડ"
}
```

2. **Run code generation**:
```bash
flutter gen-l10n
```

3. **Use in code**:
```dart
Text(AppLocalizations.of(context)!.myNewText)
```

---

## ➕ Adding a New Feature

### Example: Adding a "Notifications" Feature

### Step 1: Create Feature Folder Structure

```bash
mkdir -p lib/features/notifications/{data/{models,datasources},domain/{entities,repositories,usecases},presentation/{widgets,bloc}}
```

### Step 2: Create Domain Layer (Business Logic)

**Entity** (`domain/entities/notification.dart`):
```dart
class Notification {
  final String id;
  final String title;
  final String message;
  
  const Notification({
    required this.id,
    required this.title,
    required this.message,
  });
}
```

**Repository Interface** (`domain/repositories/notification_repository.dart`):
```dart
abstract class NotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications();
}
```

**Use Case** (`domain/usecases/get_notifications_usecase.dart`):
```dart
@injectable
class GetNotificationsUseCase {
  final NotificationRepository _repository;
  
  GetNotificationsUseCase(this._repository);
  
  Future<Either<Failure, List<Notification>>> call() {
    return _repository.getNotifications();
  }
}
```

### Step 3: Create Data Layer

**Model** (`data/models/notification_model.dart`):
```dart
@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String title,
    required String message,
  }) = _NotificationModel;
  
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
```

**Datasource** (`data/datasources/notification_remote_datasource.dart`):
```dart
@injectable
class NotificationRemoteDatasource {
  Future<List<NotificationModel>> getNotifications() async {
    // Mock data for now
    await Future.delayed(Duration(seconds: 1));
    
    return [
      NotificationModel(
        id: '1',
        title: 'Welcome',
        message: 'Welcome to the app!',
      ),
    ];
  }
}
```

**Repository Implementation** (`data/notification_repository_impl.dart`):
```dart
@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDatasource _datasource;
  
  NotificationRepositoryImpl(this._datasource);
  
  @override
  Future<Either<Failure, List<Notification>>> getNotifications() async {
    try {
      final models = await _datasource.getNotifications();
      return Right(models);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

### Step 4: Create Presentation Layer

**BLoC** (`presentation/bloc/notification_bloc.dart`):
```dart
@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  
  NotificationBloc(this._getNotificationsUseCase) 
      : super(const NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
  }
  
  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationLoading());
    
    final result = await _getNotificationsUseCase();
    
    result.fold(
      (failure) => emit(NotificationError(failure.message)),
      (notifications) => emit(NotificationLoaded(notifications)),
    );
  }
}
```

**Page** (`presentation/notifications_page.dart`):
```dart
@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationBloc>()
          ..add(const LoadNotifications()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Notifications')),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return const LoadingWidget();
            } else if (state is NotificationLoaded) {
              return ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  return ListTile(
                    title: Text(notification.title),
                    subtitle: Text(notification.message),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
```

### Step 5: Add Route

Update `lib/core/config/router/app_router.dart`:
```dart
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    // ... existing routes
    AutoRoute(page: NotificationsRoute.page),
  ];
}
```

### Step 6: Generate Code

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📱 Adding a New Screen (Simple UI-Only)

For simple screens without business logic:

### Step 1: Create Page File

```dart
// lib/features/about/about_page.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: Text('About Page'),
      ),
    );
  }
}
```

### Step 2: Add Route

```dart
// lib/core/config/router/app_router.dart
AutoRoute(page: AboutRoute.page),
```

### Step 3: Generate Routes

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Step 4: Navigate to Screen

```dart
context.router.push(const AboutRoute());
```

---

## 🌐 Adding New API Integration

### Step 1: Define Endpoint

```dart
// lib/core/network/api_endpoints.dart
class ApiEndpoints {
  static const String baseUrl = AppConfig.baseUrl;
  static const String notifications = '/notifications';  // Add new endpoint
}
```

### Step 2: Create Datasource

```dart
@injectable
class NotificationRemoteDatasource {
  final ApiClient _client;
  
  NotificationRemoteDatasource(this._client);
  
  Future<ApiResponse<List<NotificationModel>>> getNotifications() async {
    try {
      // TODO: Replace with real API when ready
      // final response = await _client.get(ApiEndpoints.notifications);
      
      // MOCK: Simulate API delay
      await Future.delayed(Duration(seconds: 2));
      
      // MOCK: Return fake response
      final mockResponse = {
        'statusCode': 200,
        'success': true,
        'message': 'Success',
        'data': [
          {
            'id': '1',
            'title': 'Welcome',
            'message': 'Welcome to the app!',
          }
        ]
      };
      
      return ApiResponse.fromJson(
        mockResponse,
        (json) => (json as List)
            .map((item) => NotificationModel.fromJson(item))
            .toList(),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
```

### Step 3: When Real API is Ready

Just uncomment the real API call and remove mock:

```dart
Future<ApiResponse<List<NotificationModel>>> getNotifications() async {
  try {
    // Real API call
    final response = await _client.get(ApiEndpoints.notifications);
    
    return ApiResponse.fromJson(
      response.data,
      (json) => (json as List)
          .map((item) => NotificationModel.fromJson(item))
          .toList(),
    );
  } catch (e) {
    throw ServerException(e.toString());
  }
}
```

---

## 🎨 Customizing Theme

### Update Colors

Edit `lib/core/theme/app_colors.dart`:
```dart
class AppColors {
  static const Color primary = Color(0xFF6200EE);  // Change this
  static const Color secondary = Color(0xFF03DAC6);  // Change this
}
```

### Update Text Styles

Edit `lib/core/theme/app_text_styles.dart`:
```dart
static const TextStyle h1 = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
);
```

### Apply Changes

```bash
flutter run
# Hot reload (press 'r' in terminal)
```

---

## 🚀 Commands Reference

### Initial Setup

```bash
# Get dependencies
flutter pub get

# Generate code (routes, DI, models, localization)
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
```

### Development

```bash
# Run app
flutter run

# Hot reload (in running app terminal)
r

# Hot restart
R

# Watch mode (auto-rebuild on file changes)
dart run build_runner watch --delete-conflicting-outputs
```

### Code Generation

```bash
# Generate all code
dart run build_runner build --delete-conflicting-outputs

# Clean and rebuild
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs

# Generate localization only
flutter gen-l10n
```

### Code Quality

```bash
# Analyze code
flutter analyze

# Format code
dart format lib/

# Run tests
flutter test
```

### Build

```bash
# Build APK (Android)
flutter build apk --release

# Build App Bundle (Android)
flutter build appbundle --release

# Build iOS
flutter build ios --release
```

---

## 📦 Key Dependencies

- **flutter_bloc** - State management
- **auto_route** - Type-safe navigation
- **get_it** + **injectable** - Dependency injection
- **dio** - HTTP client
- **freezed** - Immutable models
- **dartz** - Functional programming (Either)
- **shared_preferences** - Local storage
- **flutter_secure_storage** - Secure storage

---

## 🔧 Troubleshooting

### Code generation not working?

```bash
flutter clean
flutter pub get
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Localization not updating?

```bash
flutter gen-l10n
flutter run
```

### DI not finding dependencies?

Make sure class has `@injectable` annotation and run:
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📚 Learn More

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [AutoRoute](https://autoroute.vercel.app/)

---

## 📄 License

This project is open source and available under the MIT License.
