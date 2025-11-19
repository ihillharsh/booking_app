import 'dart:math';

import 'package:app_initial_structure/core/config/router/app_router.dart';
import 'package:app_initial_structure/core/l10n/app_localizations.dart';
import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/inputs/custome_image_view.dart';
import 'package:app_initial_structure/gen/assets.gen.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToLogin() {
    context.router.replace(const LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [_buildFirstPage(), _buildSecondPage()],
      ),
    );
  }

  Widget _buildFirstPage() {
    return SafeArea(
      top: true,
      bottom: false,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: RichText(
                  text: TextSpan(
                    text: "Discount at\ntheir ",
                    style: AppTextStyles.instance.h2,
                    children: [
                      TextSpan(text: 'BEST ', style: AppTextStyles.instance.h1),
                      TextSpan(text: 'and\n', style: AppTextStyles.instance.h2),
                      TextSpan(
                        text: 'FREE Cancellation!',
                        style: AppTextStyles.instance.h1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: AppImage(imagePath: Assets.images.onboarding1.path),
              ),
            ],
          ),
          Positioned(
            bottom: 20.h,
            right: 20.h,
            child: GestureDetector(
              onTap: _nextPage,
              child: Container(
                height: 60.h,
                width: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                  size: 30.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondPage() {
    return Stack(
      children: [
        SafeArea(
          top: true,
          bottom: false,
          child: Center(
            child: Column(
              spacing: 20.h,
              children: [
                Text(
                  AppLocalizations.of(context)!.discover,
                  style: AppTextStyles.instance.h2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppLocalizations.of(context)!.chooseAndExplore,
                  style: AppTextStyles.instance.h3.copyWith(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        CustomPaint(
          size: Size(SizeUtils.width, SizeUtils.height),
          painter: OnboardingPainter(),
        ),
        Padding(
          padding: EdgeInsets.only(top: SizeUtils.height * 0.3),
          child: AppImage(imagePath: Assets.images.onboarding2.path),
        ),
        Positioned(
          bottom: 20.h,
          right: 20.h,
          child: GestureDetector(
            onTap: _navigateToLogin,
            child: Container(
              height: 60.h,
              width: 60.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.black,
                size: 30.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.black
          ..style = PaintingStyle.fill;

    final path =
        Path()
          ..moveTo(0, size.height * 0.41) // Mid-left
          ..lineTo(
            size.width,
            size.height * 0.54,
          ) // Slightly lower on the right
          ..lineTo(size.width, size.height) // Bottom-right
          ..lineTo(0, size.height) // Bottom-left
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
