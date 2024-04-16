import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/country_model.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.countryModel});

  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 5.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border:
        Border.all(color: Colors.white, width: 2.w),
      ),
      child: ListTile(
        leading: Text(
          "+${countryModel.phone.length > 3 ? countryModel.phone.substring(countryModel.phone.length - 3) : countryModel.phone}",
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.white.withOpacity(
              0.6,
            ),
          ),
        ),
        title: Text(
          countryModel.name,
          style: AppTextStyle.interBold,
        ),
        trailing: Container(
          padding:
          EdgeInsets.symmetric(horizontal: 10.w),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            countryModel.emoji,
            style: AppTextStyle.interBold
                .copyWith(fontSize: 30.w),
          ),
        ),
        subtitle: Text(
          countryModel.continent,
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.white.withOpacity(
              0.6,
            ),
          ),
        ),
      ),
    );
  }
}
