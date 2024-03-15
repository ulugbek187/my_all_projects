import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class SecondViewWidget extends StatelessWidget {
  const SecondViewWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.id,
    required this.imagePath,
  });

  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final int id;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      subtitle: Text(subTitle),
      titleTextStyle: AppTextStyle.interBold.copyWith(
        color: AppColors.black.withOpacity(0.7),
        fontSize: 20.sp,
        fontWeight: FontWeight.w900,
      ),
      subtitleTextStyle: AppTextStyle.interBold.copyWith(
        color: AppColors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      leading: Text(
        id.toString(),
      ),
      leadingAndTrailingTextStyle: AppTextStyle.interBold.copyWith(
        color: Colors.brown,
        fontSize: 20.sp,
        fontWeight: FontWeight.w900,
      ),
      trailing: Image.network(
        imagePath,
        height: 50.h,
        width: 50.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
