import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.onChanged, required this.controller, });

 final ValueChanged<String> onChanged;
 final TextEditingController controller;

  @override
  Widget build(BuildContext context) {


    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.white,
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 30.w,
          color: AppColors.white,
        ),
        hintText: "Search",
        hintStyle: const TextStyle(
          color: Colors.white,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.w,
          ),
        ),
      ),
    );
  }
}
