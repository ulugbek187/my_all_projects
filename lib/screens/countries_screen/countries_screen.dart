// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/countries_model/countries_model.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/first_repo.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
import '../../view_models/first_view_model.dart';
import '../countries_detail_screen/countries_detail_screen.dart';
import '../global_widgets/view_items.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

final FirstRepo firstRepo = FirstRepo();

class _CountriesScreenState extends State<CountriesScreen> {
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
            widget.title,
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: context.watch<FirstViewModel>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(seconds: 2),
                    () {
                      context.read<FirstViewModel>().fetchFirstData();
                    },
                  );
                },
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.8,
                  padding: EdgeInsets.all(20.w),
                  children: [
                    ...List.generate(
                      context.watch<FirstViewModel>().currencies.length,
                      (index) {
                        CountriesModel first =
                            context.watch<FirstViewModel>().currencies[index];
                        return ViewItems(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountriesDetailScreen(
                                  firstModel: first,
                                ),
                              ),
                            );
                          },
                          title: first.name["common"],
                          subTitle: first.subregion,
                          imagePath: first.flags['png'],
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
