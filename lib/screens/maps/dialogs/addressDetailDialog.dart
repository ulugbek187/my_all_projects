import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_all_projects/data/models/place_category.dart';
import 'package:my_all_projects/data/models/place_model.dart';
import 'package:my_all_projects/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

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
            TextField(
              controller: controller,
            ),
            const SizedBox(height: 24),
            TextButton(
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
                child: const Text("SAVE PLACE"))
          ],
        ),
      );
    },
  );
}
