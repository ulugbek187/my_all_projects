import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class ViewItems extends StatelessWidget {
  const ViewItems({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            SizedBox(height: 7.h,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  0.r,
                ),
                border: Border.all(
                  color: AppColors.black,
                  width: 1.w,
                ),
              ),
              child: Image.network(
                imagePath,
                height: 60.h,
                width: 130.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 7.h,),
            Text(
              title,
              style: AppTextStyle.interBold.copyWith(
                color: AppColors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 5.h,),
            Text(
              subTitle,
              style: AppTextStyle.interBold.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//ListTile(
//       onTap: onTap,
//       title: Text(title),
//       titleTextStyle: AppTextStyle.interBold.copyWith(
//         color: AppColors.black,
//         fontSize: 20.sp,
//         fontWeight: FontWeight.w900,
//       ),
//       subtitle: Text(subTitle),
//       subtitleTextStyle: AppTextStyle.interBold.copyWith(
//         color: AppColors.black.withOpacity(
//           0.5,
//         ),
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w600,
//       ),
//       trailing: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(
//             0.r,
//           ),
//           border: Border.all(
//             color: AppColors.black,
//             width: 1.w,
//           ),
//         ),
//         child: Image.network(
//           imagePath,
//           height: 50.h,
//           width: 100.w,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
