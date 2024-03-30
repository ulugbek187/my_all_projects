import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:my_all_projects/data/models/place_category.dart';
import 'package:my_all_projects/data/models/place_model.dart';
import 'package:my_all_projects/screens/maps/dialogs/text_field.dart';

addressDetailDialog({
  required BuildContext context,
  required ValueChanged<PlaceModel> placeModel,
}) {
  final TextEditingController controller = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MyTextField(
                  type: TextInputType.text,
                  hinText: "Save address",
                  onChanged: (v) {},
                  controller: controller),
            ),
            SizedBox(height: 16.h),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                placeModel.call(
                  PlaceModel(
                    entrance: "",
                    flatNumber: "",
                    orientAddress: "",
                    placeCategory: PlaceCategory.home,
                    latLng: const LatLng(0, 0),
                    placeName: "a",
                    stage: "",
                  ),
                );
              },
              child: const Text(
                "SAVE PLACE",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      );
    },
  );
}
