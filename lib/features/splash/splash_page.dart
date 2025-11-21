import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confetti/confetti.dart';
import '../../core/di/injection.dart';
import '../../core/config/router/app_router.dart';
import 'bloc/splash_bloc.dart';
import 'bloc/splash_event.dart';
import 'bloc/splash_state.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashBloc>()..add(const CheckAuthStatus()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          // context.router.replace(const HomeRoute());

          if (state is Authenticated) {
            context.router.replace(const MainRoute());
          } else if (state is Unauthenticated ) {
            context.router.replace(const OnboardingRoute());
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.images.splashLogo.path)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
