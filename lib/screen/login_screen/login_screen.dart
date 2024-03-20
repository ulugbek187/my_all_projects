import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/others/app_reg_exp.dart';
import 'package:my_all_projects/screen/hello_screen/hello_screen.dart';
import 'package:my_all_projects/screen/login_screen/widgets/text_field.dart';
import 'package:my_all_projects/view_models/login_view_models.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();

  _init() async {
    User? user = FirebaseAuth.instance.currentUser;

    Future.microtask(() {
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

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
              SizedBox(height: 20.h),
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
              SizedBox(
                height: 110.h,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    MyTextField(
                      type: TextInputType.text,
                      iconPath: "assets/icons/email.svg",
                      hinText: "Email",
                      onChanged: (value) {
                        context.read<LoginViewModel>().updateEmail(value);
                      },
                      regExp: AppConstants.emailRegExp,
                      errorText: 'Emailni togri kiriting',
                      controller: emailControler,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    MyTextField(
                      type: TextInputType.name,
                      iconPath: "assets/icons/lock.svg",
                      hinText: "Password",
                      onChanged: (value) {
                        context.read<LoginViewModel>().updatePassword(value);
                      },
                      regExp: AppConstants.passwordRegExp,
                      errorText: 'Parolni togri kiriting',
                      controller: passwordControler,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    bool validated = formKey.currentState!.validate();
                    if (validated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("SUCCESS!"),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("ERROR!!!")));
                    }
                    context.read<LoginViewModel>().login(context);
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
