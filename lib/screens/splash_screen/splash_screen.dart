import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_all_projects/screens/global_screen/global_screen.dart';
import 'package:my_all_projects/utils/images/app_images.dart';

class MyProekt extends StatefulWidget {
  const MyProekt({super.key});

  @override
  State<MyProekt> createState() => _MyProektState();
}

class _MyProektState extends State<MyProekt> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GlobalScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
          ),
          child: Image.asset(
            AppImages.quiz,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
