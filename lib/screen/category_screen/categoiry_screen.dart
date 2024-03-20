import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/computer_models_2/product_info_model.dart';
import 'package:my_all_projects/data/repositories/computer_repository.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/computer_models/network_responce.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.id});

  final int id;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ComputerRepository computerRepository = ComputerRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent.withOpacity(0.4),
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
      body: FutureBuilder(
        future: computerRepository.getAllInfo(widget.id),
        builder: (
          BuildContext context,
          AsyncSnapshot<NetworkResponse> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductInfoModel> productInfoModel =
                snapshot.data!.data as List<ProductInfoModel>;
            return Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue.withOpacity(0.1),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                children: [
                  ...List.generate(
                    productInfoModel.length,
                    (index) {
                      return Expanded(child:  ZoomTapAnimation(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              padding:
                              EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.h,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    productInfoModel[index].imageUrl,
                                    height: 80.h,
                                    width: 200.w,
                                  ),
                                  Text(
                                    productInfoModel[index].name,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp),
                                  ),
                                  Text(
                                    "${productInfoModel[index].price.toString()} \$",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),);
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
