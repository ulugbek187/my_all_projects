// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../data/models/person_model/person_model.dart';
import '../../data/repositories/second_repo.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
import '../../view_models/second_view_model.dart';
import '../second_detail_screen/second_detail_screen.dart';
import '../second_detail_screen/widgets/second_view_widget.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

final SecondRepo secondRepo = SecondRepo();

class _PersonScreenState extends State<PersonScreen> {
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
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: context.watch<SecondViewModel>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(seconds: 2),
                    () {
                      context.read<SecondViewModel>().fetchSecondData();
                    },
                  );
                },
                child: ListView(
                  children: [
                    ...List.generate(
                      context.watch<SecondViewModel>().currencies.length,
                      (index) {
                        PersonModel first =
                            context.watch<SecondViewModel>().currencies[index];
                        return SecondViewWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PersonDetailScreen(secondModel: first),
                              ),
                            );
                          },
                          title: first.name,
                          subTitle: first.username,
                          id: first.id,
                          imagePath: first.avatarUrl,
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
