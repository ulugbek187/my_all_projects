import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_all_projects/screens/study/widgets/study_items.dart';
import 'package:my_all_projects/utils/app_colors.dart';
import 'package:my_all_projects/utils/app_images.dart';
import 'package:my_all_projects/utils/size_utils.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFDFDFD,
      appBar: AppBar(
        backgroundColor: AppColors.cFDFDFD,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            36.getH(),
            Text(
              "Academic backgr.",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            36.getH(),
            const StudyItems(
              text1: "Specialization",
              text2: 'UX/UI Design',
              text3: "La Zona - FUE (Fundación\nUniversidad Empresa)",
              text4: "Year: 2022",
            ),
            36.getH(),
            const StudyItems(
              text1: "Specialization",
              text2: 'UX/UI Design',
              text3: "La Zona - FUE (Fundación\nUniversidad Empresa)",
              text4: "Year: 2022",
            ),
          ],
        ),
      ),
    );
  }
}
