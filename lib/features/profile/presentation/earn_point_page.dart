import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:app_initial_structure/core/theme/app_text_styles.dart';
import 'package:app_initial_structure/core/utils/size_utils.dart';
import 'package:app_initial_structure/core/widgets/inputs/common_appbar.dart';
import 'package:app_initial_structure/features/widget/dotted_bottom_border.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class EarnPointPage extends StatelessWidget {
  const EarnPointPage({super.key});

  static const int _totalPoints = 102;
  static const String _referralCode = 'JOIN4UN57';
  static const List<PointHistory> _pointHistory = [
    PointHistory(
      userName: 'Ethan Walker',
      date: '10 November 2025',
      points: 10,
    ),
    PointHistory(
      userName: 'Ethan Walker',
      date: '10 November 2025',
      points: 10,
    ),
    PointHistory(
      userName: 'Ethan Walker',
      date: '10 November 2025',
      points: 10,
    ),
    PointHistory(
      userName: 'Ethan Walker',
      date: '10 November 2025',
      points: 10,
    ),
    PointHistory(
      userName: 'Ethan Walker',
      date: '10 November 2025',
      points: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        title: 'Earn Point',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invite Friend',
              style: AppTextStyles.instance.h5.copyWith(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Earn and redeem rewards',
              style: AppTextStyles.instance.bodyMedium.copyWith(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 20.h),
            _PointsCard(
              totalPoints: _totalPoints,
              referralCode: _referralCode,
            ),
            SizedBox(height: 30.h),
            Text(
              'Point History',
              style: AppTextStyles.instance.h5.copyWith(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 20.h),
            _PointHistoryList(history: _pointHistory),
          ],
        ),
      ),
    );
  }
}

class PointHistory {
  final String userName;
  final String date;
  final int points;

  const PointHistory({
    required this.userName,
    required this.date,
    required this.points,
  });
}

class _PointsCard extends StatelessWidget {
  final int totalPoints;
  final String referralCode;

  const _PointsCard({
    required this.totalPoints,
    required this.referralCode,
  });

  void _copyReferralCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: referralCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Referral code copied!'),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteOpacity50, width: 1),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Column(
        children: [
          DottedBottomBorder(
            padding: 20.h,
            color: AppColors.whiteOpacity50,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.stars,
                    color: AppColors.black,
                    size: 24.h,
                  ),
                ),
                SizedBox(width: 15.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$totalPoints pts',
                      style: AppTextStyles.instance.h4.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total Point Earned',
                      style: AppTextStyles.instance.bodySmall.copyWith(
                        color: AppColors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Referral Code',
                    style: AppTextStyles.instance.bodySmall.copyWith(
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Text(
                        referralCode,
                        style: AppTextStyles.instance.bodyLargeBold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      GestureDetector(
                        onTap: () => _copyReferralCode(context),
                        child: Icon(
                          Icons.copy,
                          color: AppColors.white,
                          size: 18.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement share
                    },
                    child: Icon(
                      Icons.share,
                      color: AppColors.white,
                      size: 24.h,
                    ),
                  ),
                  SizedBox(width: 20.h),
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement QR code
                    },
                    child: Icon(
                      Icons.qr_code,
                      color: AppColors.white,
                      size: 24.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PointHistoryList extends StatelessWidget {
  final List<PointHistory> history;

  const _PointHistoryList({required this.history});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteOpacity50, width: 1),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Column(
        children: List.generate(history.length, (index) {
          final item = history[index];
          final isLast = index == history.length - 1;
          return Column(
            children: [
              _PointHistoryItem(item: item),
              if (!isLast) ...[
                SizedBox(height: 15.h),
                Divider(
                  color: AppColors.white.withOpacity(0.3),
                  height: 1,
                ),
                SizedBox(height: 15.h),
              ],
            ],
          );
        }),
      ),
    );
  }
}

class _PointHistoryItem extends StatelessWidget {
  final PointHistory item;

  const _PointHistoryItem({required this.item});

  String _getInitials(String name) {
    final names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25.h,
          backgroundColor: AppColors.white,
          child: Text(
            _getInitials(item.userName),
            style: AppTextStyles.instance.bodyLargeBold.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        SizedBox(width: 15.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.userName,
                style: AppTextStyles.instance.bodyMediumSemibold.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                item.date,
                style: AppTextStyles.instance.bodySmall.copyWith(
                  color: AppColors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        Text(
          '+${item.points} Point',
          style: AppTextStyles.instance.bodyMediumSemibold.copyWith(
            color: AppColors.green,
          ),
        ),
      ],
    );
  }
}
