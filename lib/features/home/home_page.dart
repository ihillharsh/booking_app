import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/inputs/common_appbar.dart';
import 'package:app_initial_structure/core/widgets/inputs/custom_text_field.dart';
import 'package:app_initial_structure/core/widgets/inputs/custome_image_view.dart';
import 'package:app_initial_structure/features/home/bloc/home_state.dart';
import 'package:app_initial_structure/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/config/router/app_router.dart';
import '../../core/di/injection.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../widget/app_card_widget.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'widgets/filter_bottom_sheet.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const LoadHomeData()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: CustomAppBar(showBackButton: false,),
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
                            child: GestureDetector(
                              onTap: () {
                                context.router.push(const SearchRoute());
                              },
                              child: AbsorbPointer(
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
                                        .copyWith(
                                          color: AppColors.blackOpacity50,
                                        ),
                                    textStyle:
                                        AppTextStyles.instance.bodyMedium,
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
                            ),
                          ),
                          const SizedBox(width: 12),
                          BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (bottomSheetContext) {
                                      return BlocProvider.value(
                                        value: context.read<HomeBloc>(),
                                        child: FilterBottomSheet(
                                          state: state,
                                          onDistanceChanged:
                                              (v) => context
                                                  .read<HomeBloc>()
                                                  .add(UpdateFilterDistance(v)),
                                          onPriceChanged:
                                              (v) => context
                                                  .read<HomeBloc>()
                                                  .add(UpdateFilterPrice(v)),
                                          onRatingChanged:
                                              (v) => context
                                                  .read<HomeBloc>()
                                                  .add(UpdateFilterRating(v)),
                                          onDiscountChanged:
                                              (v) => context
                                                  .read<HomeBloc>()
                                                  .add(UpdateFilterDiscount(v)),
                                          onClearAll:
                                              () => context
                                                  .read<HomeBloc>()
                                                  .add(const ClearFilters()),
                                          onApply: () {
                                            context.read<HomeBloc>().add(
                                              const ApplyFilters(),
                                            );
                                            Navigator.pop(bottomSheetContext);
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: 45.h,
                                  height: 45.h,
                                  padding: EdgeInsets.all(12.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Iconify(SimpleIcons.filter)
                                ),
                              );
                            },
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
                      // Special Offer Carousel
                      Column(
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              height: 345.h,
                              enlargeCenterPage: false,
                              autoPlay: false,
                              autoPlayInterval: const Duration(seconds: 3),
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentCarouselIndex = index;
                                });
                              },
                            ),
                            itemCount: 3,
                            itemBuilder: (context, index, realIndex) {
                              final offers = [
                                {
                                  'discount': 10.0,
                                  'rating': 4.8,
                                  'name': "Glow & Grace Unisex Salon",
                                  'location': "Chandkheda, Ahmedabad",
                                },
                                {
                                  'discount': 15.0,
                                  'rating': 4.5,
                                  'name': "The Style Studio",
                                  'location': "Satellite, Ahmedabad",
                                },
                                {
                                  'discount': 20.0,
                                  'rating': 4.9,
                                  'name': "Elite Cuts & Colors",
                                  'location': "Vastrapur, Ahmedabad",
                                },
                              ];

                              final offer = offers[index];
                              return SpecialOfferCard(
                                rating: offer['rating'] as double,
                                name: offer['name'] as String,
                                isSalon: true,
                                showDetails: true,
                                discount: 10,
                                location: offer['location'] as String,
                                onTap: () => context.router.push(SalonDetailsRoute(salonId: '24')),

                              );
                            },
                          ),
                          SizedBox(height: 12.h),
                          AnimatedSmoothIndicator(
                            activeIndex: _currentCarouselIndex,
                            count: 3,
                            effect: WormEffect(
                              dotHeight: 8.h,
                              dotWidth: 8.h,
                              activeDotColor: AppColors.primary,
                              dotColor: AppColors.white.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),

                      // Near By Section
                      Text(
                        'Near By',
                        style: AppTextStyles.instance.h5.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      // Near By Cards
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 20.h),
                              child: SpecialOfferCard(
                                showDetails: false,
                                isSmallCard: true,
                                rating: 4.8,
                                name: "Blush & Bloom Salon",
                                isSalon: true,
                                location: "S.G. Highway, Ahmedabad",
                                isVeg: true,
                                onTap: () => context.router.push(RestaurantDetailsRoute(restaurantId: '24')),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
