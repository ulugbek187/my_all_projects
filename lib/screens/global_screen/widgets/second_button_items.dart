import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';

class SecondButtonItems extends StatelessWidget {
  const SecondButtonItems({
    super.key,
    required this.text,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,
        margin: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.h,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.interBold.copyWith(
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
