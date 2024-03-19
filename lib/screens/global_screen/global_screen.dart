import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/global_widgets/button_items.dart';
import 'package:my_all_projects/global_widgets/result_item.dart';
import 'package:my_all_projects/global_widgets/second_button_items.dart';
import 'package:my_all_projects/models/button_model/button_model.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';
import 'package:my_all_projects/utils/images/app_images.dart';
import 'package:my_all_projects/view_models/calculator_view_model.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppColors.black,
              height: 355.h,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 200.h,
                ),
                child: const JavoblarItem(),
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
                  color: Colors.black.withOpacity(0.8),
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
                            imageUrl: buttonModels[index].image,
                            onTap: () {
                              if (index == 0) {
                                context.read<ViewModel>().clear();
                              }
                              if (index == 1) {
                                context
                                    .read<ViewModel>()
                                    .divideByPercentage();
                              }
                              if (index == 2) {
                                context.read<ViewModel>().backspace();
                              }
                              if (index == 3) {
                                context
                                    .read<ViewModel>()
                                    .appendOperator("/");
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
                          (index) => SecondItems(
                            text: firstButtonModel[index],
                            onTap: () {
                              context.read<ViewModel>().appendDigit(
                                    firstButtonModel[index],
                                  );
                            },
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.multiply,
                          onTap: () {
                            context
                                .read<ViewModel>()
                                .appendOperator("*");
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          firstButtonModel.length,
                          (index) => SecondItems(
                            text: secondButtonModel[index],
                            onTap: () {
                              context.read<ViewModel>().appendDigit(
                                    secondButtonModel[index],
                                  );
                            },
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.subtract,
                          onTap: () {
                            context
                                .read<ViewModel>()
                                .appendOperator("-");
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          firstButtonModel.length,
                          (index) => SecondItems(
                            text: thirdButtonModel[index],
                            onTap: () {
                              context.read<ViewModel>().appendDigit(
                                    thirdButtonModel[index],
                                  );
                            },
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.add,
                          onTap: () {
                            context
                                .read<ViewModel>()
                                .appendOperator("+");
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          fourthButtonModel.length,
                          (index) => SecondItems(
                            text: fourthButtonModel[index],
                            onTap: () {
                              context.read<ViewModel>().appendDigit(
                                    fourthButtonModel[index],
                                  );
                            },
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.history,
                          onTap: () {},
                        ),
                        ButtonItems(
                          imageUrl: AppImages.equal,
                          onTap: () {
                            context
                                .read<ViewModel>()
                                .calculateResult();
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
