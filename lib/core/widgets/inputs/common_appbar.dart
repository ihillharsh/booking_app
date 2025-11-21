import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';
import '../../../gen/assets.gen.dart';
import '../../theme/app_text_styles.dart';
import 'custome_image_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showFilterButton = false,
    this.showInfoButton = false,
    this.showBackButton = true,
    this.onBackPressed,
    this.onFilterPressed,
    this.onLocationTapped,
    this.onHeartPressed,
    this.onNotificationPressed,
    this.backgroundColor,
    this.userName = 'Ethan',
    this.locationText = 'Ahemedabad, Gujarat',
  });

  final String? title;
  final bool showBackButton;
  final bool showFilterButton;
  final bool showInfoButton;
  final VoidCallback? onBackPressed;
  final VoidCallback? onFilterPressed;
  final VoidCallback? onLocationTapped;
  final VoidCallback? onHeartPressed;
  final VoidCallback? onNotificationPressed;
  final Color? backgroundColor;
  final String userName;
  final String locationText;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  bool get _hasTitle => title != null && title!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.black,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      toolbarHeight: preferredSize.height,
      leading: _buildLeading(context),
      title: _buildTitleWidget(context),
      actions: _buildActions(context),
    );
  }

  // Leading Widget Logic
  Widget? _buildLeading(BuildContext context) {
    if (showBackButton) {
      return _buildBackButton(context);
    }

    if (!_hasTitle) {
      return _buildLocationIcon();
    }

    return null;
  }

  // Title Widget Logic
  Widget _buildTitleWidget(BuildContext context) {
    return _hasTitle ? _buildTitle() : _buildLocationInfo();
  }

  // Actions Widget Logic
  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];

    if (showFilterButton) {
      actions.add(_buildFilterIcon());
    }

    if (!_hasTitle) {
      actions.add(_buildHomeActions());
    }

    return actions;
  }

  // Title Text
  Widget _buildTitle() {
    return Text(
      title!,
      style: AppTextStyles.instance.h5.copyWith(color: AppColors.white),
      textAlign: TextAlign.center,
    );
  }

  // Location Info (Greeting + Location)
  Widget _buildLocationInfo() {
    return GestureDetector(
      onTap: onLocationTapped ?? () => debugPrint('Location Tapped'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hello $userName',
            style: AppTextStyles.instance.bodySmall.copyWith(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Text(
                locationText,
                style: AppTextStyles.instance.bodyMediumSemibold,
              ),
              SizedBox(width: 4.h),
              const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.iconPrimary,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Location Icon (Leading)
  Widget _buildLocationIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 20.h),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(7.h),
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.location_on,
          color: AppColors.black,
          size: 27.h,
        ),
      ),
    );
  }

  // Back Button
  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: onBackPressed ?? () => Navigator.of(context).pop(),
      child: SizedBox(
        height: 30.h,
        width: 50.h,
        child: Icon(
          Icons.arrow_back,
          color: AppColors.white,
          size: 24.h,
        ),
      ),
    );
  }

  // Filter Icon Button
  Widget _buildFilterIcon() {
    return Container(
      margin: EdgeInsets.only(right: 20.h),
      padding: EdgeInsets.all(10.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: onFilterPressed,
        child: Iconify(SimpleIcons.filter, size: 20.h),
      ),
    );
  }

  // Home Screen Actions (Heart + Bell)
  Widget _buildHomeActions() {
    return Padding(
      padding:  EdgeInsets.only(right: 20.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onHeartPressed ?? () => debugPrint('Heart pressed'),
            child: AppImage(imagePath: Assets.icons.heart.path),
          ),
          SizedBox(width: 20.h),
          GestureDetector(
            onTap: onNotificationPressed ?? () => debugPrint('Notification pressed'),
            child: Iconify(
              Lucide.bell,
              color: Colors.white,
              size: 30.h,
            ),
          ),
        ],
      ),
    );
  }
}