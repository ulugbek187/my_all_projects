import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_all_projects/screens/addresses/addresses_screen.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';
import 'package:my_all_projects/utils/images/app_images.dart';
import 'package:my_all_projects/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 10));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddressesScreen();
        },
      ),
    );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<MapsViewModel>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Deafult"),
      ),
      body: Center(
        child: Lottie.asset(
          AppImages.mapsLottie,
        ),
      ),
    );
  }
}
