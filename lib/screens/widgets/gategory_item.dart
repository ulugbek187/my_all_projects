import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_all_projects/utils/images/app_images.dart';
import 'package:my_all_projects/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

class GategoryTypeItem extends StatelessWidget {
  const GategoryTypeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: PopupMenuButton(
              padding: const EdgeInsets.all(0),
              splashRadius: 50,
              icon: Image.asset(
                AppImages.others,
                width: 40.w,
                height: 40.h,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text(
                          "Home",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      context
                          .read<MapsViewModel>()
                          .changeMapType(MapType.normal);
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.work_history_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text(
                          "Work",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      context
                          .read<MapsViewModel>()
                          .changeMapType(MapType.hybrid);
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.auto_awesome_mosaic_outlined,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text(
                          "Others",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      context
                          .read<MapsViewModel>()
                          .changeMapType(MapType.satellite);
                    },
                  ),
                ];
              },
            ),
          )
        ],
      ),
    );
  }
}
