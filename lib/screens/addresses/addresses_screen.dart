import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/screens/maps/google_maps_screen.dart';
import 'package:my_all_projects/screens/maps/update_address_screen.dart';
import 'package:my_all_projects/utils/images/app_images.dart';
import 'package:my_all_projects/view_models/addressess_view_model.dart';
import 'package:provider/provider.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("May Addresses"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AddressesViewModel>(
              builder: (context, viewModel, child) {
                return ListView(
                  children: [
                    ...List.generate(
                      viewModel.myAddresses.length,
                      (index) {
                        var myAddress = viewModel.myAddresses[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UpdateAddressScreen(
                                    placeModel: myAddress,
                                  );
                                },
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              margin: const EdgeInsets.all(12),
                              height: 100.h,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Image.asset(
                                    AppImages.home,
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Home"),
                                      SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          myAddress.placeName,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.blue, fontSize: 10.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.cancel,
                                      size: 35.w,
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return GoogleMapsScreen();
                  },
                ),
              );
            },
            child: Text(
              "Yangi address qo'shish",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
