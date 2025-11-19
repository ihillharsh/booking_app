import 'package:app_initial_structure/features/onboarding/onboarding_page.dart';
import 'package:auto_route/auto_route.dart';
import '../../../features/auth/presentation/forgot_password_page.dart';
import '../../../features/auth/presentation/otp_verification_page.dart';
import '../../../features/auth/presentation/reset_password_page.dart';
import '../../../features/splash/splash_page.dart';
import '../../../features/auth/presentation/login_page.dart';
import '../../../features/auth/presentation/signup_page.dart';
import '../../../features/main/main_page.dart';
import '../../../features/home/home_page.dart';
import '../../../features/favourite/favourite_page.dart';
import '../../../features/settings/settings_page.dart';
import '../../../features/profile/presentation/profile_page.dart';
import '../../../features/profile/presentation/profile_detail_page.dart';
import '../../../features/search/search_page.dart';
import '../../../features/salon_details/salon_details_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: OtpVerificationRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: ProfileDetailRoute.page),

    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: SalonDetailsRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
  ];
}
