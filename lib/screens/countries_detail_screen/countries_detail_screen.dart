// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/countries_model/countries_model.dart';
import 'package:my_all_projects/screens/countries_detail_screen/widgets/detail_items.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';

class CountriesDetailScreen extends StatefulWidget {
  const CountriesDetailScreen({
    super.key,
    required this.firstModel,
  });

  final CountriesModel firstModel;

  @override
  State<CountriesDetailScreen> createState() => _CountriesDetailScreenState();
}

class _CountriesDetailScreenState extends State<CountriesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          centerTitle: false,
          title: Text(
            widget.firstModel.name["official"],
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 10.w,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "BAYROG'I:",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Center(
                  child: Image.network(
                    widget.firstModel.flags['png'],
                    width: double.infinity,
                  ),
                ),
                Center(
                  child: Text(
                    "GERBI:",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Image.network(
                  widget.firstModel.coatOfArms["png"],
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
