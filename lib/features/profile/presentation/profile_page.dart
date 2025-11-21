import 'package:app_initial_structure/core/config/router/app_router.dart';
import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text('Profile', style: AppTextStyles.instance.h6.white),
              SizedBox(height: 20.h),

              // Profile Card
              _buildProfileCard(context),
              SizedBox(height: 20.h),

              // Booking Statistics
              Text('Booking Statistic', style: AppTextStyles.instance.h6.white),
              SizedBox(height: 20.h),
              _buildBookingStats(),
              SizedBox(height: 20.h),

              // General Section
              Text('General', style: AppTextStyles.instance.h6.white),
              SizedBox(height: 20.h),

              // Menu Items
              _buildMenuItem(
                context,
                icon: Icons.monetization_on_outlined,
                title: 'Earn Point',
                onTap: () {
                  context.router.push(EarnPointRoute());
                },
              ),
              SizedBox(height: 12.h),
              _buildMenuItem(
                context,
                icon: Icons.card_membership_outlined,
                title: 'Subscription',
                onTap: () {
                  context.router.push(
                    ProfileDetailRoute(fieldName: 'Subscription'),
                  );
                },
              ),
              SizedBox(height: 12.h),
              _buildMenuItem(
                context,
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {
                  context.router.push(
                    ProfileDetailRoute(fieldName: 'Privacy Policy'),
                  );
                },
              ),
              SizedBox(height: 12.h),
              _buildMenuItem(
                context,
                icon: Icons.description_outlined,
                title: 'Terms & Condition',
                onTap: () {
                  context.router.push(
                    ProfileDetailRoute(fieldName: 'Terms & Condition'),
                  );
                },
              ),
              SizedBox(height: 12.h),
              _buildMenuItem(
                context,
                icon: Icons.star_outline,
                title: 'Rate Us',
                onTap: () {
                  context.router.push(ProfileDetailRoute(fieldName: 'Rate Us'));
                },
              ),
              SizedBox(height: 12.h),
              _buildMenuItem(
                context,
                icon: Icons.help_outline,
                title: 'Faq',
                onTap: () {
                  context.router.push(FaqRoute());
                },
              ),
              SizedBox(height: 12.h),
              _buildMenuItem(
                context,
                icon: Icons.headset_mic_outlined,
                title: 'Customer Support',
                onTap: () {
                  context.router.push(CustomerSupportRoute());
                },
              ),
              SizedBox(height: 12.h),
              _buildMenuItem(
                context,
                icon: Icons.logout,
                title: 'Logout',
                iconColor: AppColors.primary,
                titleColor: AppColors.primary,
                onTap: () {
                  // TODO: Implement logout
                  context.router.pushAndPopUntil(
                    const LoginRoute(),
                    predicate: (route) => false,
                  );
                },
              ),
              SizedBox(height: 12.h),
              _buildMenuItem(
                context,
                icon: Icons.delete_outline,
                title: 'Delete Account',
                iconColor: AppColors.error,
                titleColor: AppColors.error,
                onTap: () {
                  _showDeleteAccountDialog(context);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(ProfileDetailRoute(fieldName: 'Edit Profile'));
      },
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteOpacity50),
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 30.h,
              backgroundColor: AppColors.grey,
              child: Icon(Icons.person, size: 32.h, color: AppColors.white),
            ),
            SizedBox(width: 16.h),
            // Name and Email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ethan Walker',
                    style: AppTextStyles.instance.bodyLarge.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'ethanwalker@gmail.com',
                    style: AppTextStyles.instance.bodySmall.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Arrow Icon
            Icon(Icons.chevron_right, color: AppColors.white, size: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingStats() {
    return Row(
      children: [
        Expanded(child: _buildStatCard('Complete', '12')),
        SizedBox(width: 12.h),
        Expanded(child: _buildStatCard('Active', '06')),
        SizedBox(width: 12.h),
        Expanded(child: _buildStatCard('Cancel', '02')),
      ],
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteOpacity50),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Column(
        spacing: 5.h,
        children: [
          Text(label, style: AppTextStyles.instance.bodyLarge.white),
          Divider(color: AppColors.grey),
          Text(value, style: AppTextStyles.instance.h5.white),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? titleColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteOpacity50),
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? AppColors.white, size: 24.h),
            SizedBox(width: 16.h),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.instance.bodyMedium.copyWith(
                  color: titleColor ?? AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: iconColor ?? AppColors.white,
              size: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            backgroundColor: AppColors.surfaceDark,
            title: Text(
              'Delete Account',
              style: AppTextStyles.instance.h5.copyWith(color: AppColors.white),
            ),
            content: Text(
              'Are you sure you want to delete your account? This action cannot be undone.',
              style: AppTextStyles.instance.bodyMedium.copyWith(
                color: AppColors.grey,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(
                  'Cancel',
                  style: AppTextStyles.instance.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  // TODO: Implement delete account
                },
                child: Text(
                  'Delete',
                  style: AppTextStyles.instance.bodyMedium.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
