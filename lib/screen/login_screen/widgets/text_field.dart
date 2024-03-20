import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_all_projects/view_models/login_view_models.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.type,
    required this.iconPath,
    required this.hinText,
  });

  final TextInputType type;
  final String iconPath;
  final String hinText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (value){
      //   context.read<LoginViewModel>().updateEmail(value);
      // },

      keyboardType: type,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.05000000074505806),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
        prefixIcon: iconPath.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: SvgPicture.asset(
                  iconPath,
                  width: 13.w,
                  height: 12.h,
                ),
              )
            : null,
        hintText: hinText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
