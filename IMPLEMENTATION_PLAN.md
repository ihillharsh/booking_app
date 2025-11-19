# Flutter App Implementation Plan

## Project Overview
Scalable Flutter app with:
- **Navigation:** AutoRoute
- **State Management:** BLoC
- **Localization:** English, Hindi, Gujarati
- **Theme:** Light/Dark mode support
- **Features:** Splash → Auth → Main (Home, Favourite, Profile, Settings)

---

## Phase 1: Project Setup & Dependencies

### 1.1 Add Dependencies to pubspec.yaml
```yaml
dependencies:
  # State Management
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  hydrated_bloc: ^9.1.3          # Persist BLoC state
  
  # Navigation
  auto_route: ^7.8.4
  
  # Localization
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0
  
  # Network
  dio: ^5.4.0
  pretty_dio_logger: ^1.3.1      # Better logging
  connectivity_plus: ^5.0.2      # Network connectivity
  
  # Storage
  shared_preferences: ^2.2.2
  flutter_secure_storage: ^9.0.0
  hive: ^2.2.3                   # Fast local database
  hive_flutter: ^1.1.0
  path_provider: ^2.1.1          # File paths
  
  # Dependency Injection
  get_it: ^7.6.4
  injectable: ^2.3.2
  
  # Functional Programming
  dartz: ^0.10.1                 # Either for error handling
  
  # UI
  confetti: ^0.7.0
  cached_network_image: ^3.3.0   # Image caching
  shimmer: ^3.0.0                # Loading shimmer
  
  # Utilities
  logger: ^2.0.2                 # Better logging
  package_info_plus: ^5.0.1      # App info
  
dev_dependencies:
  # Code Generation
  build_runner: ^2.4.7
  auto_route_generator: ^7.3.2
  injectable_generator: ^2.4.1
  freezed: ^2.4.6
  freezed_annotation: ^2.4.1
  json_serializable: ^6.7.1
  hive_generator: ^2.0.1
  
  # Testing
  mocktail: ^1.0.1               # Mocking for tests
  bloc_test: ^9.1.5              # BLoC testing
```

### 1.2 Enable Code Generation
Run: `flutter pub get`

---

## Phase 2: Core Foundation Structure (Enhanced for Scalability)

### 2.1 Directory Structure
```
lib/
├── core/
│   ├── config/
│   │   ├── app_config.dart              # App configuration (API base URL, etc.)
│   │   └── router/
│   │       ├── app_router.dart          # AutoRoute setup
│   │       ├── app_router.gr.dart       # Generated routes
│   │       └── route_guards.dart        # Auth guards, etc.
│   ├── theme/
│   │   ├── app_theme.dart               # Theme data (light/dark)
│   │   ├── app_colors.dart              # Color constants
│   │   ├── app_text_styles.dart         # Typography
│   │   ├── app_dimensions.dart          # Spacing, sizes
│   │   └── theme_extensions.dart        # Custom theme extensions
│   ├── l10n/
│   │   ├── app_en.arb                   # English translations
│   │   ├── app_hi.arb                   # Hindi translations
│   │   ├── app_gu.arb                   # Gujarati translations
│   │   └── l10n.yaml                    # Localization config
│   ├── utils/
│   │   ├── validators.dart              # Form validators
│   │   ├── extensions/
│   │   │   ├── string_extensions.dart   # String helpers
│   │   │   ├── context_extensions.dart  # BuildContext helpers
│   │   │   ├── date_extensions.dart     # DateTime helpers
│   │   │   └── num_extensions.dart      # Number helpers
│   │   ├── helpers/
│   │   │   ├── logger.dart              # Logging utility
│   │   │   ├── date_formatter.dart      # Date formatting
│   │   │   └── debouncer.dart           # Debounce utility
│   │   └── constants.dart               # App constants
│   ├── widgets/
│   │   ├── buttons/
│   │   │   ├── primary_button.dart      # Primary CTA button
│   │   │   ├── secondary_button.dart    # Secondary button
│   │   │   ├── text_button.dart         # Text button
│   │   │   └── icon_button.dart         # Icon button
│   │   ├── inputs/
│   │   │   ├── custom_text_field.dart   # Base text field
│   │   │   ├── email_field.dart         # Email input
│   │   │   ├── password_field.dart      # Password input
│   │   │   └── search_field.dart        # Search input
│   │   ├── feedback/
│   │   │   ├── loading_widget.dart      # Loading indicator
│   │   │   ├── error_widget.dart        # Error display
│   │   │   ├── empty_state.dart         # Empty state
│   │   │   └── snackbar_helper.dart     # Snackbar utility
│   │   ├── layout/
│   │   │   ├── responsive_builder.dart  # Responsive layout
│   │   │   ├── safe_area_wrapper.dart   # Safe area wrapper
│   │   │   └── scroll_wrapper.dart      # Scroll wrapper
│   │   └── common/
│   │       ├── app_bar_widget.dart      # Custom app bar
│   │       ├── bottom_sheet_wrapper.dart # Bottom sheet
│   │       └── dialog_wrapper.dart      # Dialog wrapper
│   ├── network/
│   │   ├── api_client.dart              # Dio setup (ready for real API)
│   │   ├── api_endpoints.dart           # API URLs
│   │   ├── interceptors/
│   │   │   ├── auth_interceptor.dart    # Auth token injection
│   │   │   └── logging_interceptor.dart # Request/response logging
│   │   ├── api_response.dart            # Generic API response wrapper
│   │   └── network_exceptions.dart      # Custom exceptions
│   ├── errors/
│   │   ├── failures.dart                # Failure classes
│   │   └── exceptions.dart              # Exception classes
│   ├── storage/
│   │   ├── local_storage.dart           # SharedPreferences wrapper
│   │   └── secure_storage.dart          # Secure storage wrapper
│   └── di/
│       ├── injection.dart               # GetIt setup
│       └── injection.config.dart        # Generated DI
├── shared/                               # Shared across features
│   ├── domain/
│   │   ├── entities/
│   │   │   └── base_entity.dart         # Base entity class
│   │   └── repositories/
│   │       └── base_repository.dart     # Base repository interface
│   ├── data/
│   │   ├── models/
│   │   │   └── base_model.dart          # Base model with JSON
│   │   └── repositories/
│   │       └── base_repository_impl.dart # Base repo implementation
│   └── presentation/
│       └── bloc/
│           ├── base_bloc.dart           # Base BLoC with common logic
│           ├── base_state.dart          # Base state (loading, success, error)
│           └── base_event.dart          # Base events
├── features/
│   ├── splash/
│   │   ├── splash_page.dart
│   │   ├── widgets/
│   │   │   └── confetti_animation.dart
│   │   └── bloc/
│   │       ├── splash_bloc.dart
│   │       ├── splash_event.dart
│   │       └── splash_state.dart
│   │
│   ├── auth/
│   │   ├── data/
│   │   │   ├── auth_repository_impl.dart
│   │   │   ├── auth_remote_datasource.dart  # Mock now, real API later
│   │   │   └── models/
│   │   │       └── user_model.dart
│   │   ├── domain/
│   │   │   ├── auth_repository.dart         # Interface
│   │   │   ├── entities/
│   │   │   │   └── user.dart
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart
│   │   │       └── logout_usecase.dart
│   │   └── presentation/
│   │       ├── login_page.dart
│   │       ├── widgets/
│   │       │   └── login_form.dart
│   │       └── bloc/
│   │           ├── auth_bloc.dart
│   │           ├── auth_event.dart
│   │           └── auth_state.dart
│   │
│   ├── main/
│   │   ├── main_page.dart               # Bottom nav container
│   │   ├── widgets/
│   │   │   └── bottom_nav_bar.dart
│   │   └── bloc/
│   │       ├── navigation_bloc.dart
│   │       ├── navigation_event.dart
│   │       └── navigation_state.dart
│   │
│   ├── home/
│   │   ├── home_page.dart
│   │   ├── widgets/
│   │   │   └── home_header.dart
│   │   └── bloc/
│   │       ├── home_bloc.dart
│   │       ├── home_event.dart
│   │       └── home_state.dart
│   │
│   ├── favourite/
│   │   ├── favourite_page.dart
│   │   └── bloc/
│   │       ├── favourite_bloc.dart
│   │       ├── favourite_event.dart
│   │       └── favourite_state.dart
│   │
│   ├── settings/
│   │   ├── settings_page.dart
│   │   ├── widgets/
│   │   │   └── settings_tile.dart
│   │   └── bloc/
│   │       ├── settings_bloc.dart
│   │       ├── settings_event.dart
│   │       └── settings_state.dart
│   │
│   └── profile/
│       ├── data/
│       │   ├── preferences_repository_impl.dart
│       │   └── preferences_datasource.dart
│       ├── domain/
│       │   ├── preferences_repository.dart
│       │   └── usecases/
│       │       ├── change_theme_usecase.dart
│       │       └── change_language_usecase.dart
│       └── presentation/
│           ├── profile_page.dart
│           ├── widgets/
│           │   ├── theme_selector.dart
│           │   ├── language_selector.dart
│           │   └── profile_menu_item.dart
│           └── bloc/
│               ├── profile_bloc.dart
│               ├── profile_event.dart
│               └── profile_state.dart
└── main.dart
```

---

## Phase 3: Implementation Steps

### Step 1: Setup Localization (l10n)
1. Create `l10n.yaml` in root directory
2. Create ARB files for 3 languages (en, hi, gu)
3. Run code generation: `flutter gen-l10n`
4. Configure in `main.dart`

### Step 2: Setup Theme System
1. Create `app_colors.dart` with color palette
2. Create `app_text_styles.dart` with typography
3. Create `app_theme.dart` with light/dark themes
4. Create theme BLoC for theme switching

### Step 3: Setup Dependency Injection
1. Create `injection.dart` with GetIt configuration
2. Use `@injectable` annotations
3. Run: `flutter pub run build_runner build --delete-conflicting-outputs`

### Step 4: Setup AutoRoute Navigation
1. Create `app_router.dart` with route definitions
2. Define routes for all screens
3. Setup guards for authentication
4. Run: `flutter pub run build_runner build --delete-conflicting-outputs`

### Step 5: Implement Splash Screen
1. Create splash page with confetti animation
2. Create splash BLoC to check auth status
3. Navigate to auth or main based on login status

### Step 6: Implement Authentication
1. Create auth remote datasource (structured like real API, returns mock data with delay)
2. Create auth repository implementation
3. Create login use case
4. Create auth BLoC with login logic
5. Create login page with email/password form
6. Store auth token in secure storage
7. Mock response includes proper status codes (200), success flags, and data structure
8. When real API is ready, just replace mock response with actual API call

### Step 7: Implement Main Navigation
1. Create main page with bottom navigation
2. Create navigation BLoC for tab switching
3. Setup 4 tabs: Home, Favourite, Settings, Profile

### Step 8: Implement Feature Pages
1. **Home Page:** 
   - Simple greeting with user info
   - Home BLoC for state management
   - Placeholder content
2. **Favourite Page:** 
   - Empty state initially
   - Favourite BLoC for managing favourites
   - Placeholder content
3. **Settings Page:** 
   - App settings list
   - Settings BLoC for managing preferences
   - Placeholder content
4. **Profile Page:** 
   - Theme switcher (Light/Dark)
   - Language selector (EN/HI/GU)
   - Logout button
   - Profile BLoC for user preferences

### Step 9: Create Reusable Widgets
1. Custom button with loading state
2. Custom text field with validation
3. Loading widget
4. Error widget

### Step 10: Wire Everything Together
1. Setup BlocProviders in main.dart
2. Configure AutoRoute
3. Configure localization
4. Test navigation flow
5. Test theme switching
6. Test language switching

---

## Phase 4: Testing & Refinement

### 4.1 Test Flows
- [ ] Splash → Login → Home
- [ ] Theme switching persists
- [ ] Language switching works
- [ ] Bottom navigation works
- [ ] Logout returns to login

### 4.2 Code Quality
- [ ] Run `flutter analyze`
- [ ] Fix all linting issues
- [ ] Add comments to complex logic

---

## Phase 5: Advanced Scalability & Reusability Patterns

### 5.1 Reusable Base Classes

#### Base BLoC Pattern
```dart
// All BLoCs extend this for common functionality
abstract class BaseBloc<E, S> extends Bloc<E, S> {
  - Error handling
  - Loading states
  - Logging
  - Analytics tracking
}
```

#### Base Repository Pattern
```dart
// All repositories implement this
abstract class BaseRepository {
  - Network error handling
  - Caching strategy
  - Retry logic
  - Offline support
}
```

#### Base UseCase Pattern
```dart
// All use cases extend this
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
```

### 5.2 Generic Response Wrapper
```dart
class ApiResponse<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final bool success;
}
```

### 5.3 Reusable Widget System

#### Component Library Structure
- **Atomic Design Pattern:**
  - Atoms: Buttons, inputs, icons
  - Molecules: Form fields with labels, cards
  - Organisms: Forms, lists, navigation bars
  - Templates: Page layouts
  - Pages: Complete screens

#### Widget Composition
```dart
// Composable widgets with consistent API
CustomButton(
  text: 'Login',
  onPressed: () {},
  isLoading: state.isLoading,
  variant: ButtonVariant.primary,
)
```

### 5.4 Feature Module Template (Simplified & Scalable)

**Simple features (UI-only, no business logic):**
```
features/[feature_name]/
├── [feature_name]_page.dart     # Main page
└── widgets/                     # Feature-specific widgets
    └── [widget_name].dart
```

**Complex features (with data/business logic):**
```
features/[feature_name]/
├── data/
│   ├── [feature]_repository_impl.dart
│   ├── [feature]_datasource.dart        # Mock or real API
│   └── models/
│       └── [model_name].dart
├── domain/
│   ├── [feature]_repository.dart        # Interface
│   ├── entities/
│   │   └── [entity_name].dart
│   └── usecases/
│       └── [usecase_name].dart
└── presentation/
    ├── [feature_name]_page.dart         # Main page
    ├── widgets/
    │   └── [widget_name].dart
    └── bloc/
        ├── [feature]_bloc.dart
        ├── [feature]_event.dart
        └── [feature]_state.dart
```

**Key Principles:**
- Start simple, add layers only when needed
- Pages at feature root for easy access
- Only create data/domain when you have business logic
- Flat structure reduces navigation complexity

### 5.5 How to Add New Features (Step-by-Step)

**For Simple UI-Only Features:**

1. **Create Feature Folder:**
   ```bash
   mkdir -p lib/features/[feature_name]/widgets
   ```

2. **Create Page:**
   ```dart
   // lib/features/[feature_name]/[feature_name]_page.dart
   class FeaturePage extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('Feature')),
         body: Center(child: Text('Feature Content')),
       );
     }
   }
   ```

3. **Add Route:**
   ```dart
   @AutoRoute(page: FeaturePage)
   ```

4. **Run Code Generation:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

**For Complex Features with Business Logic:**

1. **Create Feature Structure:**
   ```bash
   mkdir -p lib/features/[feature_name]/{data/models,domain/{entities,usecases},presentation/{widgets,bloc}}
   ```

2. **Define Domain Layer:**
   - Create entity (pure Dart class)
   - Create repository interface
   - Create use case

3. **Implement Data Layer:**
   - Create mock datasource (returns static data)
   - Create repository implementation
   - Create models if needed

4. **Build Presentation:**
   - Create BLoC (extends BaseBloc)
   - Create page at feature root
   - Create widgets

5. **Register in DI:**
   ```dart
   @injectable
   class FeatureRepository implements IFeatureRepository {
     // implementation
   }
   ```

6. **Add Route & Generate:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

**When to Use Which:**
- **Simple:** Static pages, settings, about, terms
- **Complex:** Auth, profile, data-heavy features

### 5.6 How to Add New Languages

1. Create ARB file: `lib/core/l10n/app_[locale].arb`
2. Copy all keys from `app_en.arb`
3. Translate values
4. Run: `flutter gen-l10n`
5. Add to `MaterialApp`:
   ```dart
   supportedLocales: [
     Locale('en'),
     Locale('hi'),
     Locale('gu'),
     Locale('[new_locale]'),
   ]
   ```

### 5.7 API Setup Strategy (Mock Now, Real Later)

**Current Approach: Mock responses with real API structure**

We'll structure the code as if calling a real API, but return mock data with delays to simulate network calls. When the real API is ready, minimal changes needed.

**Example: Login API**

```dart
@injectable
class AuthRemoteDatasource {
  final Dio _dio;
  
  AuthRemoteDatasource(this._dio);
  
  Future<ApiResponse<UserModel>> login(String email, String password) async {
    try {
      // TODO: Replace with real API call when backend is ready
      // final response = await _dio.post('/auth/login', data: {
      //   'email': email,
      //   'password': password,
      // });
      
      // MOCK: Simulate API delay
      await Future.delayed(Duration(seconds: 2));
      
      // MOCK: Return fake response with real API structure
      final mockResponse = {
        'statusCode': 200,
        'success': true,
        'message': 'Login successful',
        'data': {
          'id': 'user_123',
          'email': email,
          'name': 'John Doe',
          'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
        }
      };
      
      return ApiResponse<UserModel>.fromJson(
        mockResponse,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
```

**Repository stays the same:**
```dart
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await _remoteDatasource.login(email, password);
      return Right(response.data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
```

**When Real API is Ready:**
Just uncomment the real API call and remove mock code:
```dart
Future<ApiResponse<UserModel>> login(String email, String password) async {
  try {
    // Real API call
    final response = await _dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    
    return ApiResponse<UserModel>.fromJson(
      response.data,
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    );
  } catch (e) {
    throw ServerException(e.toString());
  }
}
```

**Benefits:**
- ✅ Same code structure as real API
- ✅ Test error handling, loading states, response parsing
- ✅ Minimal changes when switching to real API (just swap the call)
- ✅ Repository, UseCase, BLoC remain unchanged
- ✅ Realistic delays simulate actual network behavior

### 5.8 Simple Configuration (Single Environment)

**Single config file for the app:**
```dart
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
```

**Usage:**
```dart
// In repository
if (AppConfig.useMockData) {
  return await mockDatasource.getData();
} else {
  return await remoteDatasource.getData();
}
```

### 5.9 Caching Strategy

**Implement cache-first approach:**
```dart
@override
Future<Either<Failure, Data>> getData() async {
  try {
    // 1. Try cache first
    final cachedData = await localDatasource.getCached();
    if (cachedData != null && !cachedData.isExpired) {
      return Right(cachedData);
    }
    
    // 2. Fetch from network
    final remoteData = await remoteDatasource.fetch();
    
    // 3. Cache the result
    await localDatasource.cache(remoteData);
    
    return Right(remoteData);
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}
```

### 5.10 Testing Strategy

**Each feature should have:**
```
test/
├── features/
│   └── [feature_name]/
│       ├── data/
│       │   ├── models/
│       │   ├── datasources/
│       │   └── repositories/
│       ├── domain/
│       │   └── usecases/
│       └── presentation/
│           └── bloc/
```

**Test patterns:**
- Unit tests for use cases
- Widget tests for UI
- BLoC tests with `bloc_test`
- Mock with `mocktail`

### 5.11 Code Generation Commands

```bash
# Watch mode (auto-rebuild on changes)
flutter pub run build_runner watch --delete-conflicting-outputs

# One-time build
flutter pub run build_runner build --delete-conflicting-outputs

# Clean and rebuild
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs

# Generate localization
flutter gen-l10n
```

### 5.12 Performance Optimization

**Built-in optimizations:**
- Lazy loading with `@lazySingleton`
- Image caching with `cached_network_image`
- List optimization with `ListView.builder`
- State persistence with `hydrated_bloc`
- Debouncing for search/input
- Pagination for large lists

### 5.13 Monitoring & Analytics

**Add analytics wrapper:**
```dart
abstract class AnalyticsService {
  void logEvent(String name, Map<String, dynamic> params);
  void logScreen(String screenName);
  void setUserId(String userId);
}
```

**Track in BLoC:**
```dart
@override
void onEvent(Event event) {
  analytics.logEvent('bloc_event', {'event': event.toString()});
  super.onEvent(event);
}
```

---

## Execution Order

1. ✅ Add all dependencies
2. ✅ Setup l10n configuration
3. ✅ Create theme system
4. ✅ Setup DI with GetIt
5. ✅ Setup AutoRoute
6. ✅ Implement Splash
7. ✅ Implement Auth
8. ✅ Implement Main Navigation
9. ✅ Implement all feature pages
10. ✅ Test complete flow

---

## Commands Reference

```bash
# Get dependencies
flutter pub get

# Generate code (routes, DI, models)
flutter pub run build_runner build --delete-conflicting-outputs

# Generate localization
flutter gen-l10n

# Watch mode for development
flutter pub run build_runner watch --delete-conflicting-outputs

# Run app
flutter run

# Analyze code
flutter analyze
```

---

## Key Architectural Decisions for Scalability

### 1. **Separation of Concerns**
- Domain layer has ZERO dependencies on Flutter/external packages
- Data layer depends only on domain interfaces
- Presentation layer depends on domain use cases, not repositories

### 2. **Dependency Inversion**
- All dependencies point inward (toward domain)
- Use interfaces/abstract classes for flexibility
- Easy to swap implementations (mock, real API, different storage)

### 3. **Single Responsibility**
- Each class has one job
- Use cases contain single business operations
- BLoCs manage single feature state

### 4. **Open/Closed Principle**
- Base classes for extension
- Composition over inheritance
- Plugin architecture for features

### 5. **Reusability Through Composition**
- Small, focused widgets
- Composable components
- Generic wrappers (ApiResponse, BaseState)

### 6. **Type Safety**
- Freezed for immutable models
- AutoRoute for type-safe navigation
- Either<Failure, Success> for error handling

### 7. **Code Generation**
- Less boilerplate
- Fewer bugs
- Consistent patterns

### 8. **Testability**
- Dependency injection everywhere
- Mock-friendly interfaces
- Pure functions in domain layer

---

## Scalability Benefits

✅ **Add new features** without touching existing code
✅ **Swap implementations** (API, storage, auth) easily
✅ **Reuse components** across features
✅ **Test independently** with mocks
✅ **Work in parallel** - teams can work on different features
✅ **Maintain easily** - clear structure and patterns
✅ **Onboard quickly** - consistent patterns throughout
✅ **Refactor safely** - interfaces protect against breaking changes

---

## Notes

### Architecture Decisions
- **Flat feature structure:** Pages at feature root, only add layers when needed
- **API-ready mock approach:** Code structured as if calling real API, but returns mock data
- **Single environment:** No flavors, simple config file
- **Progressive complexity:** Start simple, add structure as features grow

### Technical Details
- All BLoCs extend BaseBloc for common functionality
- All routes are type-safe with AutoRoute
- Theme and language preferences stored in SharedPreferences
- Auth token stored in FlutterSecureStorage
- Mock responses use real API structure (status codes, success flags, data)
- Datasources simulate network delays (1-2 seconds)
- Freezed for immutable data classes
- Dartz Either for functional error handling
- Generic base classes reduce code duplication

### Mock to Real API Migration
- Datasources structured like real API calls
- Mock responses return proper HTTP structure (200 status, success: true, data: {})
- When backend is ready: uncomment real API call, remove mock response
- Repository, UseCase, BLoC layers remain unchanged
- Minimal code changes needed for migration

### Scalability
- Easy to add new simple features (just create page + route)
- Easy to add complex features (follow data/domain/presentation pattern)
- Seamless migration from mock to real API (change only datasource)
- Feature modules are independent and isolated
- Clean Architecture principles where needed, not everywhere
