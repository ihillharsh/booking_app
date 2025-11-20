import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/inputs/custome_image_view.dart';

const double _spacingSmall = 5;
const double _spacingMedium = 10;

class SearchResultItem extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final bool isSalon;
  final bool isOpen;
  final bool isVeg;
  final bool isSearchResult;

  const SearchResultItem({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
    required this.isSalon,
    this.isOpen = false,
    this.isVeg = true,
    this.isSearchResult = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.h)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Closed Overlay
          _buildItemImage(),
          SizedBox(width: _spacingMedium.h),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isSearchResult) _buildName(),
                _buildRatingAndStatus(),
                SizedBox(height: _spacingMedium.h),
                _buildLocation(),
                if (!isSearchResult) ...[
                  SizedBox(height: _spacingMedium.h),
                  _buildVegNonVegIndicator(isVeg: isVeg, showLabel: true),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the image section with the optional 'Closed' overlay.
  Widget _buildItemImage() {
    final double size = isSearchResult ? 80.h : 85.h;
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.h),
            child: AppImage(
              height: size,
              width: size,
              greyOut: !isOpen,
              imagePath:
                  'https://cdn.pixabay.com/photo/2023/12/01/14/34/haircut-8423833_1280.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Show 'Closed' overlay only if the item is not open
          if (!isOpen)
            Align(
              alignment: Alignment.center,
              child: Container(
                color: AppColors.sliderColor,
                height: 22.h,
                alignment: Alignment.center,
                child: Text(
                  'Closed',
                  style: AppTextStyles.instance.bodySmallSemibold.red,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Builds the name text, using conditional styling.
  Widget _buildName() {
    return Column(
      children: [
        Text(
          name,
          style: AppTextStyles.instance.bodyLargeBold.white,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: _spacingMedium.h),
      ],
    );
  }

  /// Builds the rating and status (Open/Closed or Veg/Non-Veg for search results) row.
  Widget _buildRatingAndStatus() {
    final List<Widget> children = [
      Text(
        rating.toString(),
        style:
            isSearchResult
                ? AppTextStyles.instance.bodySmall.white
                : AppTextStyles.instance.bodyLarge.white,
      ),
      SizedBox(width: _spacingSmall.h),
      Icon(Icons.star, size: 16.h, color: AppColors.starYellow),
    ];

    if (!isSalon && isSearchResult) {
      // Logic for Restaurant/Food item in Search Result mode
      children.addAll([
        SizedBox(width: _spacingMedium.h),
        _buildVegNonVegIndicator(isVeg: isVeg, showLabel: true),
      ]);
    } else if (!isSalon && !isSearchResult) {
      children.addAll([
        SizedBox(width: _spacingMedium.h),
        Icon(Icons.circle, size: 4.h, color: AppColors.white),
        SizedBox(width: _spacingMedium.h),
        Text(
          isOpen ? 'Open' : 'Closed',
          style: AppTextStyles.instance.bodyLarge.copyWith(
            color: isOpen ? Colors.green : Colors.red,
          ),
        ),
      ]);
    }

    return Row(children: children);
  }

  /// Builds the location text row.
  Widget _buildLocation() {
    return Row(
      children: [
        Icon(Icons.location_on, size: 16.h, color: AppColors.white),
        SizedBox(width: _spacingSmall.h),
        Expanded(
          child: Text(
            location,
            style:
                isSearchResult
                    ? AppTextStyles.instance.bodySmall.white
                    : AppTextStyles.instance.bodyLarge.white,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// Extracts the Veg/Non-Veg indicator into a reusable method.
  Widget _buildVegNonVegIndicator({
    required bool isVeg,
    required bool showLabel,
  }) {
    final color = isVeg ? Colors.green : Colors.red.shade600;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 1.5),
            borderRadius: BorderRadius.circular(4.h),
          ),
          child: Container(
            width: 8.h,
            height: 8.h,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
        if (showLabel) ...[
          SizedBox(width: _spacingMedium.h),
          Text(
            isVeg ? 'Veg Only' : 'Non-Veg',
            style: AppTextStyles.instance.bodyLarge.white,
          ),
        ],
      ],
    );
  }
}
