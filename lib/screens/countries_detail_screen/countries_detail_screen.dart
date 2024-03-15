// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "GERBI:",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.interBold.copyWith(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Image.network(
                      widget.firstModel.coatOfArms["png"],
                      width: 50.w,
                      height: 50.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "BAYROG'I:",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.interBold.copyWith(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.network(
                      widget.firstModel.flags['png'],
                      width: 120.w,
                      height: 50.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "All info",
                  subTitle: widget.firstModel.name["common"],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "Official name:",
                  subTitle: widget.firstModel.name['official'],
                ),
                SizedBox(
                  height: 20.h,
                ),

                Malumotlar(
                  title: "STATE NAME:",
                  subTitle: widget.firstModel.name["common"],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "THE CAPITAL:",
                  subTitle: widget.firstModel.capital[0],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "POPULATION OF:",
                  subTitle: widget.firstModel.population.toString(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "NAMED IN FIFA:",
                  subTitle: widget.firstModel.fifa,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "STATUS:",
                  subTitle: widget.firstModel.independent
                      ? "Independent"
                      : "Not independent",
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "TIME ZONE:",
                  subTitle: widget.firstModel.timezones[0],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "CONTINENT:",
                  subTitle: widget.firstModel.continents[0],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "LOCATION:",
                  subTitle: widget.firstModel.subregion,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "BEGINNING OF THE WEEK:",
                  subTitle: widget.firstModel.startOfWeek,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "AREA (km. kv da):",
                  subTitle: "${widget.firstModel.area} km. kv",
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "Region",
                  subTitle: widget.firstModel.region,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "Area",
                  subTitle: widget.firstModel.area.toString(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "Week day",
                  subTitle: widget.firstModel.startOfWeek,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "CCA2",
                  subTitle: widget.firstModel.cca2,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "CCA3",
                  subTitle: widget.firstModel.cca3,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Malumotlar(
                  title: "Subregion",
                  subTitle: widget.firstModel.subregion,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
