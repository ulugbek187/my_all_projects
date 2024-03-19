// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/models/button_model/button_model.dart';
import 'package:my_all_projects/screens/global_screen/widgets/button_items.dart';
import 'package:my_all_projects/screens/global_screen/widgets/result_item.dart';
import 'package:my_all_projects/screens/global_screen/widgets/second_button_items.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';
import 'package:my_all_projects/utils/images/app_images.dart';
import 'package:my_all_projects/view_models/calculator_view_model.dart';
import 'package:provider/provider.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppColors.black,
              height: 440.h,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 200.h,
                  bottom: 120.h,
                ),
                child: ResultItem(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 20.h,
                ),
                height: 350.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20.r,
                    ),
                    topRight: Radius.circular(
                      20.r,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          buttonModels.length,
                          (index) => ButtonItems(
                            imageUrl: buttonModels[index].image, onTap: () {
                              if(index == 0){
                                context.read<CalculatorViewModel>().clear();
                              }
                              if(index == 1){
                                context.read<CalculatorViewModel>().divideByPercentage();
                              }
                              if(index == 2){
                                context.read<CalculatorViewModel>().backspace();
                              }
                              if(index == 3){
                                context.read<CalculatorViewModel>().appendOperator("/");
                              }
                          },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          firstButtonModel.length,
                          (index) => SecondButtonItems(
                            text: firstButtonModel[index],
                            onTap: () {
                              context.read<CalculatorViewModel>().appendDigit(
                                    firstButtonModel[index],
                                  );
                            },
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.multiply, onTap: () {
                          context.read<CalculatorViewModel>().appendOperator("*");
                        },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          firstButtonModel.length,
                          (index) => SecondButtonItems(
                            text: secondButtonModel[index],
                            onTap: () {
                              context.read<CalculatorViewModel>().appendDigit(
                                    secondButtonModel[index],
                                  );
                            },
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.subtract, onTap: () {
                          context.read<CalculatorViewModel>().appendOperator("-");
                        },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          firstButtonModel.length,
                          (index) => SecondButtonItems(
                            text: thirdButtonModel[index],
                            onTap: () {
                              context.read<CalculatorViewModel>().appendDigit(
                                    thirdButtonModel[index],
                                  );
                            },
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.add, onTap: () {
                          context.read<CalculatorViewModel>().appendOperator("+");
                        },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          fourthButtonModel.length,
                          (index) => SecondButtonItems(
                            text: fourthButtonModel[index],
                            onTap: () {
                              context.read<CalculatorViewModel>().appendDigit(
                                    fourthButtonModel[index],
                                  );
                            },
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.history, onTap: () {},
                        ),
                        ButtonItems(
                          imageUrl: AppImages.equal, onTap: () {
                          context.read<CalculatorViewModel>().calculateResult();
                        },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
