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
import 'login_page.dart';

@RoutePage()
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: const Icon(Icons.arrow_back, color: AppColors.white),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),
                // Title
                Text(
                  "Let's Create Your Account",
                  style: AppTextStyles.instance.h2.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Name Field
                CustomTextField(
                  controller: _nameController,
                  hint: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
                // Email Field
                CustomTextField(
                  controller: _emailController,
                  hint: 'Email',
                  prefixIcon: Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                // Phone Number Field
                CustomTextField(
                  controller: _phoneController,
                  hint: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.phone,
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
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                // Terms & Conditions
                Row(
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: Checkbox(
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value ?? false;
                          });
                        },
                        checkColor: AppColors.black,
                        side: const BorderSide(color: AppColors.grey),
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Expanded(
                      child: Text(
                        'I agree to Privacy Policy and Terms & Condition',
                        style: AppTextStyles.instance.bodySmall.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),

                // Create Account Button
                PrimaryButton(
                  text: 'Create Account',
                  onPressed: _agreeToTerms
                      ? () {
                          context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => true,);
                        }
                      : null,
                  width: double.infinity,
                  height: 56.h,
                ),
                SizedBox.shrink(),
                // Or Sign up With
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
                        'Or Sign up With',
                        style: AppTextStyles.instance.bodyLarge.copyWith(
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
      ),
    );
  }
}
