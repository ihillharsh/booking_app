import 'package:app_initial_structure/features/onboarding/onboarding_page.dart';
import 'package:auto_route/auto_route.dart';
import '../../../features/auth/presentation/forgot_password_page.dart';
import '../../../features/auth/presentation/otp_verification_page.dart';
import '../../../features/auth/presentation/reset_password_page.dart';
import '../../../features/payment/select_payment_method_page.dart';
import '../../../features/profile/presentation/earn_point_page.dart';
import '../../../features/profile/presentation/faq_page.dart';
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
import '../../../features/restaurant_details/restaurant_details_page.dart';
import '../../../features/restaurant_booking/schedule_page.dart';
import '../../../features/restaurant_booking/choose_table_page.dart';
import '../../../features/restaurant_booking/restaurant_payment_page.dart';
import '../../../features/salon_booking/salon_booking_page.dart';
import '../../../features/booking_history/booking_history_page.dart';
import '../../../features/customer_support/customer_support_page.dart';

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
    AutoRoute(page: SalonDetailsRoute.page),
    AutoRoute(page: RestaurantDetailsRoute.page),
    AutoRoute(page: ScheduleRoute.page),
    AutoRoute(page: ChooseTableRoute.page),
    AutoRoute(page: RestaurantPaymentRoute.page),
    AutoRoute(page: SalonBookingRoute.page),
    AutoRoute(page: SelectPaymentMethodRoute.page),
    AutoRoute(page: CustomerSupportRoute.page),
    AutoRoute(page: FaqRoute.page),
    AutoRoute(page: EarnPointRoute.page),

    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: BookingHistoryRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
  ];
}
