import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/inputs/common_appbar.dart';
import 'package:app_initial_structure/core/widgets/inputs/custom_text_field.dart';
import 'package:app_initial_structure/core/widgets/inputs/custome_image_view.dart';
import 'package:app_initial_structure/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/grommet_icons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import '../../core/di/injection.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../widget/app_card_widget.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const LoadHomeData()),
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                spacing: 20.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45.h,
                          child: CustomTextField(
                            hint: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.blackOpacity50,
                            ),
                            fillColor: AppColors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.h,
                              vertical: 10.h,
                            ),
                            hintStyle: AppTextStyles.instance.bodyMedium
                                .copyWith(color: AppColors.blackOpacity50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                            disableBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.h),
                              borderSide: BorderSide.none,
                            ),
                            focusBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.h),
                              borderSide: BorderSide.none,
                            ),
                            enableBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.h),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 45.h,
                        height: 45.h,
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: AppImage(imagePath: Assets.icons.filter.path),
                      ),
                    ],
                  ),
                  // Category Chips
                  Row(
                    spacing: 20.h,
                    children: [
                      _CategoryChip(
                        iconPath: Assets.icons.restaurant.path,
                        label: 'Restaurant',
                        isSelected: false,
                      ),
                      _CategoryChip(
                        iconPath: Assets.icons.slonIcon.path,
                        label: 'Salon',
                        isSelected: false,
                      ),
                    ],
                  ),
                  // Special Offer Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Special Offer',
                        style: AppTextStyles.instance.h5.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: AppTextStyles.instance.bodyMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Special Offer Card
                  SpecialOfferCard(
                    discount: 10,
                    rating: 4.8,
                    name: "Glow & Grace Unisex Salon",
                    isSalon: true,
                    location: "Chandkheda, Ahmedabad",
                    isVeg: true,
                  ),

                  // Near By Section
                  Text(
                    'Near By',
                    style: AppTextStyles.instance.h5.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  // Near By Cards
                  SpecialOfferCard(
                   showDetails: false,
                    isSmallCard: true,
                    rating: 4.8,
                    name: "Blush & Bloom Salon",
                    isSalon: true,
                    location: "S.G. Highway, Ahmedabad",
                    isVeg: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;

  const _CategoryChip({
    required this.iconPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Row(
        children: [
          Container(
            height: 42.h,
            width: 42.h,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isSelected
                      ? AppColors.white
                      : AppColors.primary.withAlpha(125),
            ),
            child: AppImage(imagePath: iconPath),
          ),
          SizedBox(width: 10.h),
          Text(label, style: AppTextStyles.instance.bodyLargeSemibold),
          SizedBox(width: 5.h),
        ],
      ),
    );
  }
}



class _NearByCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?w=400',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Rating Badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: AppColors.ratingStar,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: AppTextStyles.instance.bodySmall.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Blush & Bloom Salon',
                  style: AppTextStyles.instance.bodySmall.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'S.G. Highway, Satellite',
                        style: AppTextStyles.instance.bodySmall.copyWith(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
