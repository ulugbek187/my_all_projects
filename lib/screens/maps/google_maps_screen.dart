import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_all_projects/data/models/place_category.dart';
import 'package:my_all_projects/data/models/place_model.dart';
import 'package:my_all_projects/screens/maps/dialogs/addressDetailDialog.dart';
import 'package:my_all_projects/screens/widgets/gategory_item.dart';
import 'package:my_all_projects/screens/widgets/map_type_item.dart';
import 'package:my_all_projects/utils/images/app_images.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';
import 'package:my_all_projects/view_models/addressess_view_model.dart';
import 'package:my_all_projects/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({
    super.key,
  });

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Consumer<MapsViewModel>(
          builder: (context, viewModel, child) {
            return Stack(
              children: [
                GoogleMap(
                  markers: viewModel.markers,
                  onCameraIdle: () {
                    if (cameraPosition != null) {
                      context
                          .read<MapsViewModel>()
                          .changeCurrentLocation(cameraPosition!);
                    }
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(const SnackBar(content: Text("IDLE")));
                  },
                  onCameraMove: (CameraPosition currentCameraPosition) {
                    cameraPosition = currentCameraPosition;
                    debugPrint(
                        "CURRENT POSITION:${currentCameraPosition.target.longitude}");
                  },
                  mapType: viewModel.mapType,
                  initialCameraPosition: viewModel.initialCameraPosition,
                  onMapCreated: (GoogleMapController createdController) {
                    viewModel.controller.complete(createdController);
                  },
                ),
                Align(
                  child: Image.asset(
                    AppImages.location,
                    width: 50,
                    height: 50,
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Text(
                      viewModel.currentPlaceName,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.interSemiBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 90.h,
                  right: 155.w,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () async {
                      PlaceModel place = PlaceModel(
                        placeCategory: PlaceCategory.home,
                        placeName: viewModel.currentPlaceName,
                        entrance: "NULL1",
                        flatNumber: "NULL1",
                        orientAddress: "NULL1",
                        stage: "NULL1",
                        latLng: cameraPosition!.target,
                      );
                      context.read<MapsViewModel>().savePlace(place);
                      context.read<AddressesViewModel>().addNewAddress(place);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<MapsViewModel>().moveToInitialPosition();
              },
              child: const Icon(Icons.gps_fixed),
            ),
            SizedBox(width: 10.w),
            FloatingActionButton(
              onPressed: () {
                addressDetailDialog(
                  context: context,
                  placeModel: (newAddressDetails) {
                    PlaceModel place = newAddressDetails;
                    place.latLng = cameraPosition!.target;
                    place.placeCategory = PlaceCategory.work;
                    context.read<AddressesViewModel>().addNewAddress(place);
                    Navigator.pop(context);
                  },
                );
              },
              child: const Icon(Icons.place),
            ),
            SizedBox(width: 10.w),
            const MapTypeItem(),
            SizedBox(width: 10.w),
            const GategoryTypeItem(),
          ],
        ),
      ),
    );
  }
}
