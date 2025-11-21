import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/inputs/common_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  static const List<FaqCategory> _faqCategories = [
    FaqCategory(
      title: 'Restaurant',
      faqs: [
        FaqItem(question: 'Do I need to make a reservation?', answer: ''),
        FaqItem(
          question: 'What are your opening hours?',
          answer: 'We\'re open daily from 11:00 AM to 11:00 PM.',
        ),
      ],
    ),
    FaqCategory(
      title: 'Salon',
      faqs: [
        FaqItem(question: 'Do you have bridal or party packages?', answer: ''),
        FaqItem(
          question: 'What services do you offer?',
          answer:
          'We offer haircuts, coloring, styling, facials, manicures, pedicures, and spa treatments.',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(title: 'Faq', showBackButton: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          _faqCategories.map((category) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: AppTextStyles.instance.h5.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 15.h),
                ...category.faqs.map((faq) => FaqTile(faq: faq)),
                SizedBox(height: 30.h),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class FaqCategory {
  final String title;
  final List<FaqItem> faqs;

  const FaqCategory({required this.title, required this.faqs});
}

class FaqItem {
  final String question;
  final String answer;

  const FaqItem({required this.question, required this.answer});
}

class FaqTile extends StatelessWidget {
  final FaqItem faq;

  const FaqTile({required this.faq, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteOpacity50, width: 1),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: faq.answer.isNotEmpty,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 15.h,
          ),
          iconColor: AppColors.white,
          collapsedIconColor: AppColors.white,

          title: Text(
            faq.question,
            style: AppTextStyles.instance.bodyMedium.copyWith(
              color: AppColors.white,
            ),
          ),
          minTileHeight: 50,
          visualDensity: VisualDensity(vertical: 0, horizontal: 0),
          dense: false,
          // expandedAlignment: Alignment.centerLeft,
          children: [
            if (faq.answer.isNotEmpty) ...[
              Divider(color: AppColors.white.withOpacity(0.3), height: 1),
              SizedBox(height: 15.h),
              Text(
                faq.answer,
                style: AppTextStyles.instance.bodyMedium.copyWith(
                  color: AppColors.white.withOpacity(0.7),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
