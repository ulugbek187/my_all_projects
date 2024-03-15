import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class SecondDetailItems extends StatelessWidget {
  const SecondDetailItems({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          subTitle,
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.black.withOpacity(0.5),
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
