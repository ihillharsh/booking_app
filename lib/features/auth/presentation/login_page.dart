import 'package:app_initial_structure/core/config/router/app_router.dart';
import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/inputs/custome_image_view.dart';
import 'package:app_initial_structure/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/inputs/custom_text_field.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            AppImage(imagePath: Assets.images.splashLogo.path, height: 60.h),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 40.h),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Back
                    Text(
                      'Welcome Back',
                      style: AppTextStyles.instance.h1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Subtitle
                    Text(
                      'Discover limitless choices and unmatched\nconvenience.',
                      style: AppTextStyles.instance.bodyMedium.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    // Email Field
                    CustomTextField(
                      controller: _emailController,
                      hint: 'Email',
                      prefixIcon: Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    // Password Field
                    CustomTextField(
                      controller: _passwordController,
                      hint: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20.h,
                              width: 20.h,
                              child: Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                fillColor: WidgetStateProperty.resolveWith(
                                  (states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return AppColors.white;
                                    }
                                    return AppColors.grey;
                                  },
                                ),
                                checkColor: AppColors.black,
                                side: const BorderSide(color: AppColors.grey),
                              ),
                            ),
                            SizedBox(width: 8.h),
                            Text(
                              'Remember Me',
                              style: AppTextStyles.instance.bodySmall.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            context.router.push(const ForgotPasswordRoute());
                          },
                          child: Text(
                            'Forget Password ?',
                            style: AppTextStyles.instance.bodySmall.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Sign In Button
                    PrimaryButton(
                      text: 'Sign In',
                      onPressed: () {
                        context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => true,);
                      },
                      width: double.infinity,
                    ),
                    // Create Account Button
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: OutlinedButton(
                        onPressed: () {
                          context.router.push(const SignupRoute());
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.h),
                          ),
                        ),
                        child: Text(
                          'Create Account',
                          style: AppTextStyles.instance.button.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox.shrink(),
                    // Or Sign in With
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.grey.withOpacity(0.3),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Text(
                            'Or Sign in With',
                            style: AppTextStyles.instance.bodySmall.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.grey.withOpacity(0.3),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    // Social Login Buttons
                    Row(
                      spacing: 30.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(iconPath: Assets.icons.google.path),
                        SocialButton(iconPath: Assets.icons.apple.path),
                        SocialButton(iconPath: Assets.icons.facebook.path),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final double? size;
  final Color? backgroundColor;
  final double? padding;

  const SocialButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.size,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final buttonSize = size ?? 40.h;
    final buttonPadding = padding ?? 7.h;
    final bgColor = backgroundColor ?? AppColors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        padding: EdgeInsets.all(buttonPadding),
        child: AppImage(imagePath: iconPath),
      ),
    );
  }
}
