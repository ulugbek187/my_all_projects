// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/person_model/person_model.dart';
import 'package:my_all_projects/screens/second_detail_screen/widgets/second_detail_items.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class PersonDetailScreen extends StatelessWidget {
  const PersonDetailScreen({
    super.key,
    required this.secondModel,
  });

  final PersonModel secondModel;

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            secondModel.name,
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.white,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
                child: Image.network(
                  secondModel.avatarUrl,
                  height: 30.h,
                  width: 30.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                secondModel.avatarUrl,
              ),
              SizedBox(
                height: 20.h,
              ),
              SecondDetailItems(
                title: "NAME:",
                subTitle: secondModel.name,
              ),
              SizedBox(
                height: 20.h,
              ),
              SecondDetailItems(
                title: "USERNAME:",
                subTitle: secondModel.username,
              ),
              SizedBox(
                height: 20.h,
              ),
              SecondDetailItems(
                title: "STATE:",
                subTitle: secondModel.state,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
