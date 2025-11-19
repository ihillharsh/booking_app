import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/inputs/common_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileDetailPage extends StatelessWidget {
  final String fieldName;

  const ProfileDetailPage({
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        showBackButton: true,
        backgroundColor: AppColors.black,
        title: fieldName,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getIconForField(fieldName),
                size: 80.h,
                color: AppColors.primary,
              ),
              SizedBox(height: 24.h),
              Text(
                fieldName,
                style: AppTextStyles.instance.h2.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                'This is a placeholder page for $fieldName.\nContent will be implemented here.',
                style: AppTextStyles.instance.bodyMedium.copyWith(
                  color: AppColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForField(String field) {
    switch (field.toLowerCase()) {
      case 'earn point':
        return Icons.monetization_on_outlined;
      case 'subscription':
        return Icons.card_membership_outlined;
      case 'privacy policy':
        return Icons.privacy_tip_outlined;
      case 'terms & condition':
        return Icons.description_outlined;
      case 'rate us':
        return Icons.star_outline;
      case 'faq':
        return Icons.help_outline;
      case 'customer support':
        return Icons.headset_mic_outlined;
      case 'edit profile':
        return Icons.person_outline;
      default:
        return Icons.info_outline;
    }
  }
}
