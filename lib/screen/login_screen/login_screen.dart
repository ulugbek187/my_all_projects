import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/screen/login_screen/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/img.png",
                width: 226.w,
                height: 186.h,
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const MyTextField(
                type: TextInputType.text,
                iconPath: "assets/icons/email.svg",
                hinText: "Email",
              ),
              SizedBox(
                height: 10.h,
              ),
              const MyTextField(
                type: TextInputType.phone,
                iconPath: "assets/icons/lock.svg",
                hinText: "Password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
