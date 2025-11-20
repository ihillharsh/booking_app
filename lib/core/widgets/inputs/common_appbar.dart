import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import '../../../gen/assets.gen.dart';
import '../../theme/app_text_styles.dart';
import 'custome_image_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.showAppleStyleBackButton = false,
    this.showLogo = false,
    this.showNotificationButton = false,
    this.showInfoButton = false,
    this.onBackPressed,
    this.onNotificationPressed,
    this.imagePath,
    this.imageHeight,
    this.showGradientBackground = false,
    this.showShadow = false,
    this.backgroundColor,
  });

  final String? title;
  final bool showBackButton;
  final bool showAppleStyleBackButton;
  final bool showLogo;
  final bool showNotificationButton;
  final bool showInfoButton;
  final VoidCallback? onBackPressed;
  final VoidCallback? onNotificationPressed;
  final String? imagePath;
  final double? imageHeight;
  final bool showGradientBackground;
  final Color? backgroundColor;
  final bool showShadow;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.black,
      automaticallyImplyLeading: false,
      shadowColor: showShadow ? AppColors.blackOpacity50 : Colors.transparent,
      elevation: showShadow ? 0.2 : 0,
      scrolledUnderElevation: 0,
      toolbarHeight: preferredSize.height,
      title:
          (title != null || (title?.isNotEmpty == true))
              ? _buildTitle(context)
              : _buildCenteredContent(context),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildBackButton(context),
        Center(
          child: Text(
            title!,
            style: AppTextStyles.instance.h5.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildCenteredContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Location Icon
          Row(
            spacing: 10.h,
            children: [
              Container(
                width: 46.h,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.location_on,
                  color: AppColors.black,
                  size: 30.h,
                ),
              ),
              // Location Text
              GestureDetector(
                onTap: () {
                  print('Location Tapped');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Ethan',
                      style: AppTextStyles.instance.bodySmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Ahemedabad, Gujarat',
                          style: AppTextStyles.instance.bodyMediumSemibold,
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.iconPrimary,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            spacing: 20.h,
            children: [
              GestureDetector(
                onTap: () {},
                child: AppImage(imagePath: Assets.icons.heart.path),
              ),
              GestureDetector(
                onTap: () {},
                child: Iconify(Lucide.bell, color: Colors.white, size: 30.h),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //  Back Button
  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: onBackPressed ?? () => Navigator.of(context).pop(),
      child: Container(
        height: 30.h,
        width: 50.h,
        alignment: Alignment.centerLeft,
        child: Icon(Icons.arrow_back, color: AppColors.white, size: 24.h),
      ),
    );
  }

  //  Logo
  Widget _buildLogo() {
    if (imagePath == null) return const SizedBox.shrink();
    return AppImage(
      imagePath: imagePath!,
      height: imageHeight ?? 22.h,
      fit: BoxFit.contain,
    );
  }

  //  Notification Button
  // Widget _buildNotificationButton(BuildContext context) {
  //   return GestureDetector(
  //     onTap:
  //         onNotificationPressed ??
  //         () => NavigatorService.pushNamed(AppRoutes.notificationScreen),
  //     child: Container(
  //       height: 40.h,
  //       width: 40.h,
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           colors: [const Color(0x7F2C1E57), appTheme.deepPurpleOpacity50],
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //         ),
  //         border: Border.all(color: appTheme.whiteOpacity50, width: 1),
  //         borderRadius: BorderRadius.circular(10.h),
  //       ),
  //       child: Padding(
  //         padding: EdgeInsets.all(8.h),
  //         child: CustomImageView(
  //           imagePath: ImageConstant.iconNotificationLine,
  //           height: 24.h,
  //           width: 24.h,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
