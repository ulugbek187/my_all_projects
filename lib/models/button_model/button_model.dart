import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/utils/images/app_images.dart';

class ButtonModel {
  final String image;
  final double height;
  final double width;

  ButtonModel({
    required this.height,
    required this.width,
    required this.image,
  });
}

final List<ButtonModel> buttonModels = [
  ButtonModel(
    height: 20.h,
    width: 20.w,
    image: AppImages.clear,
  ),
  ButtonModel(
    height: 30.h,
    width: 20.w,
    image: AppImages.precent,
  ),
  ButtonModel(
    height: 30.h,
    width: 30.w,
    image: AppImages.delete,
  ),
  ButtonModel(
    height: 30.h,
    width: 20.w,
    image: AppImages.divide,
  ),
];

final List<String> firstButtonModel = [
  "7",
  "8",
  "9",
];
final List<String> secondButtonModel = [
  "4",
  "5",
  "6",
];
final List<String> thirdButtonModel = [
  "1",
  "2",
  "3",
];
final List<String> fourthButtonModel = [
  ".",
  "0",
];
