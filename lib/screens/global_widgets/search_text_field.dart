import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldGo extends StatelessWidget {
  const TextFieldGo({
    super.key,
    required this.type,
    this.labelText,
    required this.hinText,
  });

  final TextInputType type;
  final String? labelText;
  final String hinText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: Color(0xFF090F47),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.05000000074505806),
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 15,
        ),
        errorStyle:
            const TextStyle(fontWeight: FontWeight.w400, color: Colors.red),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFBEBAB3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.all(Radius.circular(16.r)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.05000000074505806),
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.green,
        ),

        hintText: hinText,
        hintStyle:  TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: const Color(0xFF78746D),
        ),
      ),
    );
  }
}
