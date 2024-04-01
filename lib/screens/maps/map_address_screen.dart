import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_all_projects/data/models/place_model.dart';
import 'package:my_all_projects/utils/images/app_images.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';
import 'package:my_all_projects/view_models/addressess_view_model.dart';
import 'package:my_all_projects/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';
import '../widgets/map_type_item.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  int activeIndex = -1;
  String category = '';

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
                  zoomControlsEnabled: false,
                  markers: viewModel.markers,
                  onCameraIdle: () {
                    if (cameraPosition != null) {
                      context
                          .read<MapsViewModel>()
                          .changeCurrentLocation(cameraPosition!);
                    }
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
                  top: 30,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: Text(
                          viewModel.currentPlaceName,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.interSemiBold.copyWith(
                            fontSize: 16.sp,
                            color: context.watch<MapsViewModel>().mapType ==
                                MapType.normal
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25.w,
                  bottom: MediaQuery.sizeOf(context).height / 50,
                  child: GestureDetector(
                    onTap: () async {
                      PlaceModel placeModel = PlaceModel(
                        placeCategory: category,
                        lat: context
                            .read<MapsViewModel>()
                            .currentCameraPosition
                            .target
                            .latitude
                            .toString(),
                        long: context
                            .read<MapsViewModel>()
                            .currentCameraPosition
                            .target
                            .longitude
                            .toString(),
                        image: 'assets/images/$category.png',
                        docId: '',
                        placeName:
                            context.read<MapsViewModel>().currentPlaceName,
                      );
                      await context.read<AddressesViewModel>().addNewAddress(
                            placeModel: placeModel,
                          );
                      if (!context.mounted) return;
                      widget.onTap.call();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 30.w,
                      ),
                      width: 270.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: AppTextStyle.interBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20.w,
                  bottom: MediaQuery.sizeOf(context).height / 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        categories.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = index;
                            });
                            category = categories[index];
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: activeIndex == index
                                  ? Colors.blueGrey
                                  : Colors.blue,
                              borderRadius: BorderRadius.circular(
                                16.r,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: AppTextStyle.interBold.copyWith(
                                  color: activeIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<MapsViewModel>().moveToInitialPosition();
              },
              child: const Icon(Icons.gps_fixed),
            ),
            SizedBox(
              height: 20.h,
            ),
            const MapTypeItem(),
          ],
        ),
      ),
    );
  }
}

List<String> categories = [
  "home",
  "work",
  "study",
  "other",
];
