import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/computer_models/computer_models.dart';
import 'package:my_all_projects/data/repositories/computer_repository.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/computer_models/network_responce.dart';
import '../category_screen/categoiry_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ComputerRepository computerRepository = ComputerRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 32.sp,
          ),
        ),
      ),
      body: FutureBuilder(
        future: computerRepository.getAllComputerData(),
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
            List<ComputerModel> computerModel =
                snapshot.data!.data as List<ComputerModel>;

            return ListView(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                ...List.generate(
                  computerModel.length,
                  (index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                              id: computerModel[index].id,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        "${computerModel[index].name} >>> ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  },
                ),

                const ZoomTapAnimation(child: Center(
                  child: Text(
                    "All Cotegories", style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                ),),
              ],
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
