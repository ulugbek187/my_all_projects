import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/view_models/calculator_view_model.dart';
import 'package:provider/provider.dart';

class JavoblarItem extends StatelessWidget {
  const JavoblarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(
      builder: (context, calculatorProvider, _) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          alignment: Alignment.bottomRight,
          child: Text(
            calculatorProvider.displayValue,
            style: TextStyle(
              fontSize: 48.sp,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
