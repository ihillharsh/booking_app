import 'package:app_initial_structure/core/config/router/app_router.dart';
import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/inputs/common_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class OtpVerificationPage extends StatefulWidget {
  final String email;

  const OtpVerificationPage({
    required this.email,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleVerifyOtp() {
    if (_pinController.text.length == 5) {
      // Navigate to reset password page
      context.router.push(const ResetPasswordRoute());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter complete OTP'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _handleResendEmail() {
    // TODO: Implement resend email logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('OTP resent to your email'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.h,
      height: 60.h,
      textStyle: AppTextStyles.instance.h2.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 2),
        borderRadius: BorderRadius.circular(12.h),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(12.h),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(12.h),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.error, width: 2),
        borderRadius: BorderRadius.circular(12.h),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const CustomAppBar(
        showBackButton: true,
        backgroundColor: AppColors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Check Your Email',
                style: AppTextStyles.instance.h1.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),

              // Subtitle
              Text(
                'We sent a reset link to your email. Enter 5 digit code\nthat mentioned in the email',
                style: AppTextStyles.instance.bodyMedium.copyWith(
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 40.h),

              // OTP Input Field using Pinput
              Pinput(
                controller: _pinController,
                focusNode: _focusNode,
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                errorPinTheme: errorPinTheme,
                onCompleted: (pin) => _handleVerifyOtp(),
                showCursor: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                cursor: Container(
                  width: 2,
                  height: 30.h,
                  color: AppColors.primary,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 32.h),

              // Reset Password Button
              SizedBox(
                width: double.maxFinite,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: _handleVerifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.h),
                    ),
                  ),
                  child: Text(
                    'Reset Password',
                    style: AppTextStyles.instance.button.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Resend Email
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Haven't got the email yet? ",
                    style: AppTextStyles.instance.bodyMedium.copyWith(
                      color: AppColors.white,
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: _handleResendEmail,
                          child: Text(
                            'Resend email',
                            style: AppTextStyles.instance.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
