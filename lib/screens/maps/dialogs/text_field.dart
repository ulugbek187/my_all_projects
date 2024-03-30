import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.type,
    required this.hinText,
    required this.onChanged,
    required this.controller,
  });

  final TextEditingController controller;
  final TextInputType type;
  final String hinText;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      onChanged: onChanged,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.05000000074505806),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 15,
        ),
        errorStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.red),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.orange,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black,
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
        prefixIcon: const Icon(Icons.save_alt),
        hintText: hinText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
