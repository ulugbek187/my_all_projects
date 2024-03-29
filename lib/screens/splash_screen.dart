import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../utils/colors/app_colors.dart';
import '../view_models/location_view_model.dart';
import '../view_models/maps_view_model.dart';
import 'google_maps_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocationViewModel>();
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.white,
          title: Text(
            "LOCATION AND GOOGLE MAPS HOMEWORK",
            style: AppTextStyle.interBold.copyWith(
              color: Colors.black,
              fontSize: 14.sp,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  LatLng? latLng = context.read<LocationViewModel>().latLng;
                  if (latLng != null) {
                    Provider.of<MapsViewModel>(context, listen: false)
                        .setLatInitialLong(latLng);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const GoogleMapsScreen();
                        },
                      ),
                    );
                  }
                },
                child: const Text("NOTIFICATION HOMEWORK"),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  LatLng? latLng = context.read<LocationViewModel>().latLng;
                  if (latLng != null) {
                    Provider.of<MapsViewModel>(context, listen: false)
                        .setLatInitialLong(latLng);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const GoogleMapsScreen();
                        },
                      ),
                    );
                  }
                },
                child: const Text("GOOGLE MAPS HOMEWORK"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
