import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/inputs/custome_image_view.dart';
import '../../gen/assets.gen.dart';

class SpecialOfferCard extends StatelessWidget {
  final bool isOpen;
  final bool isDiscount;
  final double? discount;
  final bool isSmallCard;
  final double rating;
  final String name;
  final bool isSalon;
  final String location;
  final bool? isVeg;
  final bool showDetails;
  final bool showHearthIcon;
  final void Function()? onTap;

  const SpecialOfferCard({
    super.key,
    this.isOpen = true,
    this.isDiscount = true,
    this.isSmallCard = false,
    this.discount,
    required this.rating,
    required this.name,
    required this.isSalon,
    required this.location,
    this.isVeg,
    this.showDetails = true,
    this.showHearthIcon = false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: isSmallCard ? 300.h : double.maxFinite,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Stack(
              children: [
                Column(
                  spacing: 20.h,
                  children: [
                    AppImage(
                      imagePath:
                          'https://cdn.pixabay.com/photo/2023/12/01/14/34/haircut-8423833_1280.jpg',
                      radius: BorderRadius.circular(20.h),
                      height: 200.h,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),

                    /// MAIN CONTENT
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: showDetails ? 10.h : 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          /// LEFT SIDE (EXPANDS TO AVOID OVERFLOW)
                          Expanded(
                            child: Column(
                              spacing: 10.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// NAME + OPEN/CLOSED
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        name,
                                        style:
                                            AppTextStyles
                                                .instance
                                                .bodyLargeBold
                                                .black,
                                        overflow: TextOverflow.visible,
                                        softWrap: true,
                                      ),
                                    ),
                                    if (showDetails)
                                      Text(
                                        isOpen ? 'Open' : 'Closed',
                                        style: AppTextStyles
                                            .instance
                                            .bodyLargeSemibold
                                            .copyWith(
                                              color:
                                                  isOpen
                                                      ? Colors.green
                                                      : Colors.red,
                                            ),
                                      ),
                                  ],
                                ),

                                /// SERVICE TYPE (Salon or Food)
                                if (showDetails)
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppImage(
                                        imagePath:
                                            isSalon
                                                ? Assets.icons.slonIcon.path
                                                : Assets.icons.restaurant.path,
                                        height: 20.h,
                                        color: AppColors.black,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          isSalon
                                              ? 'Hair Cut, Facial, Blow Dry, Hair Styling'
                                              : 'Popular Dishes Available',
                                          style:
                                              AppTextStyles
                                                  .instance
                                                  .bodyMediumSemibold
                                                  .black,
                                          overflow: TextOverflow.visible,
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),

                                /// LOCATION
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 20.h,
                                      color: AppColors.black,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        location,
                                        style: AppTextStyles.instance.bodyMedium,
                                        overflow: TextOverflow.visible,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),

                                /// VEG OPTION
                                if (isVeg != null && isVeg! && !isSalon)
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppImage(
                                        imagePath: Assets.icons.veg.path,
                                        height: 15.h,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          'Veg only',
                                          style:
                                              AppTextStyles.instance.bodyMedium,
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),

                          /// RIGHT ARROW BUTTON
                          Container(
                            padding: EdgeInsets.all(8.h),
                            width: 35.h,
                            height: 35.h,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Iconify(
                              MaterialSymbols.arrow_forward_ios_rounded,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// DISCOUNT TAG
                if (isDiscount && discount != null && showDetails)
                  Positioned(
                    top: 180.h,
                    left: 10.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.h),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            color: AppColors.shadowColor,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        spacing: 10.h,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppImage(
                            imagePath: Assets.icons.discount.path,
                            height: 20.h,
                          ),
                          ShaderMask(
                            shaderCallback:
                                (bounds) => LinearGradient(
                                  colors: [
                                    AppColors.discountBegin,
                                    AppColors.discountEnd,
                                  ],
                                ).createShader(
                                  Rect.fromLTWH(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                ),
                            child: Text(
                              'Save up to ${discount!.toStringAsFixed(0)}%',
                              style: AppTextStyles.instance.bodyMediumSemibold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                /// RATING BADGE
                Positioned(
                  top: 10.h,
                  right: 0.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        bottomLeft: Radius.circular(20.h),
                      ),
                    ),
                    child: Row(
                      spacing: 5.h,
                      children: [
                        Icon(Icons.star, color: AppColors.starYellow, size: 25.h),
                        Text(
                          rating.toString(),
                          style: AppTextStyles.instance.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        ///Hearth icon
        if (showHearthIcon)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(10.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  bottomRight: Radius.circular(20.h),
                ),
              ),
              child: Iconify(Mdi.heart, color: Colors.red, size: 30.h),
            ),
          ),
      ],
    );
  }
}
