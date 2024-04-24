import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/utils/app_colors.dart';
import 'package:my_all_projects/utils/size_utils.dart';

class WrapItem extends StatelessWidget {
  const WrapItem({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 9.w,
              vertical: 12.h,
            ),
            backgroundColor: AppColors.cF1F1F1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.c_263238,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        10.getH(),
      ],
    );
  }
}
