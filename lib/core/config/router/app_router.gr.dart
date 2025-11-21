// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BookingHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingHistoryPage(),
      );
    },
    ChooseTableRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChooseTableRouteArgs>(
          orElse: () =>
              ChooseTableRouteArgs(restaurantId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChooseTablePage(restaurantId: args.restaurantId),
      );
    },
    FavouriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavouritePage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
    OtpVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpVerificationPage(email: args.email),
      );
    },
    ProfileDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileDetailPage(fieldName: args.fieldName),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordPage(),
      );
    },
    RestaurantDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RestaurantDetailsRouteArgs>(
          orElse: () => RestaurantDetailsRouteArgs(
              restaurantId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RestaurantDetailsPage(restaurantId: args.restaurantId),
      );
    },
    RestaurantPaymentRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RestaurantPaymentRouteArgs>(
          orElse: () => RestaurantPaymentRouteArgs(
              restaurantId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RestaurantPaymentPage(restaurantId: args.restaurantId),
      );
    },
    SalonBookingRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SalonBookingRouteArgs>(
          orElse: () =>
              SalonBookingRouteArgs(salonId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SalonBookingPage(salonId: args.salonId),
      );
    },
    SalonDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SalonDetailsRouteArgs>(
          orElse: () =>
              SalonDetailsRouteArgs(salonId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SalonDetailsPage(salonId: args.salonId),
      );
    },
    ScheduleRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ScheduleRouteArgs>(
          orElse: () =>
              ScheduleRouteArgs(restaurantId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SchedulePage(restaurantId: args.restaurantId),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [BookingHistoryPage]
class BookingHistoryRoute extends PageRouteInfo<void> {
  const BookingHistoryRoute({List<PageRouteInfo>? children})
      : super(
          BookingHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseTablePage]
class ChooseTableRoute extends PageRouteInfo<ChooseTableRouteArgs> {
  ChooseTableRoute({
    required String restaurantId,
    List<PageRouteInfo>? children,
  }) : super(
          ChooseTableRoute.name,
          args: ChooseTableRouteArgs(restaurantId: restaurantId),
          rawPathParams: {'id': restaurantId},
          initialChildren: children,
        );

  static const String name = 'ChooseTableRoute';

  static const PageInfo<ChooseTableRouteArgs> page =
      PageInfo<ChooseTableRouteArgs>(name);
}

class ChooseTableRouteArgs {
  const ChooseTableRouteArgs({required this.restaurantId});

  final String restaurantId;

  @override
  String toString() {
    return 'ChooseTableRouteArgs{restaurantId: $restaurantId}';
  }
}

/// generated route for
/// [FavouritePage]
class FavouriteRoute extends PageRouteInfo<void> {
  const FavouriteRoute({List<PageRouteInfo>? children})
      : super(
          FavouriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpVerificationPage]
class OtpVerificationRoute extends PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(email: email),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const PageInfo<OtpVerificationRouteArgs> page =
      PageInfo<OtpVerificationRouteArgs>(name);
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({required this.email});

  final String email;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{email: $email}';
  }
}

/// generated route for
/// [ProfileDetailPage]
class ProfileDetailRoute extends PageRouteInfo<ProfileDetailRouteArgs> {
  ProfileDetailRoute({
    required String fieldName,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileDetailRoute.name,
          args: ProfileDetailRouteArgs(fieldName: fieldName),
          initialChildren: children,
        );

  static const String name = 'ProfileDetailRoute';

  static const PageInfo<ProfileDetailRouteArgs> page =
      PageInfo<ProfileDetailRouteArgs>(name);
}

class ProfileDetailRouteArgs {
  const ProfileDetailRouteArgs({required this.fieldName});

  final String fieldName;

  @override
  String toString() {
    return 'ProfileDetailRouteArgs{fieldName: $fieldName}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RestaurantDetailsPage]
class RestaurantDetailsRoute extends PageRouteInfo<RestaurantDetailsRouteArgs> {
  RestaurantDetailsRoute({
    required String restaurantId,
    List<PageRouteInfo>? children,
  }) : super(
          RestaurantDetailsRoute.name,
          args: RestaurantDetailsRouteArgs(restaurantId: restaurantId),
          rawPathParams: {'id': restaurantId},
          initialChildren: children,
        );

  static const String name = 'RestaurantDetailsRoute';

  static const PageInfo<RestaurantDetailsRouteArgs> page =
      PageInfo<RestaurantDetailsRouteArgs>(name);
}

class RestaurantDetailsRouteArgs {
  const RestaurantDetailsRouteArgs({required this.restaurantId});

  final String restaurantId;

  @override
  String toString() {
    return 'RestaurantDetailsRouteArgs{restaurantId: $restaurantId}';
  }
}

/// generated route for
/// [RestaurantPaymentPage]
class RestaurantPaymentRoute extends PageRouteInfo<RestaurantPaymentRouteArgs> {
  RestaurantPaymentRoute({
    required String restaurantId,
    List<PageRouteInfo>? children,
  }) : super(
          RestaurantPaymentRoute.name,
          args: RestaurantPaymentRouteArgs(restaurantId: restaurantId),
          rawPathParams: {'id': restaurantId},
          initialChildren: children,
        );

  static const String name = 'RestaurantPaymentRoute';

  static const PageInfo<RestaurantPaymentRouteArgs> page =
      PageInfo<RestaurantPaymentRouteArgs>(name);
}

class RestaurantPaymentRouteArgs {
  const RestaurantPaymentRouteArgs({required this.restaurantId});

  final String restaurantId;

  @override
  String toString() {
    return 'RestaurantPaymentRouteArgs{restaurantId: $restaurantId}';
  }
}

/// generated route for
/// [SalonBookingPage]
class SalonBookingRoute extends PageRouteInfo<SalonBookingRouteArgs> {
  SalonBookingRoute({
    required String salonId,
    List<PageRouteInfo>? children,
  }) : super(
          SalonBookingRoute.name,
          args: SalonBookingRouteArgs(salonId: salonId),
          rawPathParams: {'id': salonId},
          initialChildren: children,
        );

  static const String name = 'SalonBookingRoute';

  static const PageInfo<SalonBookingRouteArgs> page =
      PageInfo<SalonBookingRouteArgs>(name);
}

class SalonBookingRouteArgs {
  const SalonBookingRouteArgs({required this.salonId});

  final String salonId;

  @override
  String toString() {
    return 'SalonBookingRouteArgs{salonId: $salonId}';
  }
}

/// generated route for
/// [SalonDetailsPage]
class SalonDetailsRoute extends PageRouteInfo<SalonDetailsRouteArgs> {
  SalonDetailsRoute({
    required String salonId,
    List<PageRouteInfo>? children,
  }) : super(
          SalonDetailsRoute.name,
          args: SalonDetailsRouteArgs(salonId: salonId),
          rawPathParams: {'id': salonId},
          initialChildren: children,
        );

  static const String name = 'SalonDetailsRoute';

  static const PageInfo<SalonDetailsRouteArgs> page =
      PageInfo<SalonDetailsRouteArgs>(name);
}

class SalonDetailsRouteArgs {
  const SalonDetailsRouteArgs({required this.salonId});

  final String salonId;

  @override
  String toString() {
    return 'SalonDetailsRouteArgs{salonId: $salonId}';
  }
}

/// generated route for
/// [SchedulePage]
class ScheduleRoute extends PageRouteInfo<ScheduleRouteArgs> {
  ScheduleRoute({
    required String restaurantId,
    List<PageRouteInfo>? children,
  }) : super(
          ScheduleRoute.name,
          args: ScheduleRouteArgs(restaurantId: restaurantId),
          rawPathParams: {'id': restaurantId},
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static const PageInfo<ScheduleRouteArgs> page =
      PageInfo<ScheduleRouteArgs>(name);
}

class ScheduleRouteArgs {
  const ScheduleRouteArgs({required this.restaurantId});

  final String restaurantId;

  @override
  String toString() {
    return 'ScheduleRouteArgs{restaurantId: $restaurantId}';
  }
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
