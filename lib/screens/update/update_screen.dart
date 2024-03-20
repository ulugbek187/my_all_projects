import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/book_model.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
import '../../view_models/book_view_model.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({
    super.key,
    required this.booksModel,
  });

  final BooksModel booksModel;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  List<String> changeData = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    const TextInputType bookNameType = TextInputType.text;
    const TextInputType authorType = TextInputType.text;
    const TextInputType categoryType = TextInputType.text;
    const TextInputType descriptionType = TextInputType.text;
    const TextInputType imageUrlType = TextInputType.text;
    const TextInputType priceType = TextInputType.number;
    const TextInputType rateType = TextInputType.number;
    List<String> oldBook = [
      widget.booksModel.bookName,
      widget.booksModel.author,
      widget.booksModel.bookCategory,
      widget.booksModel.description,
      widget.booksModel.imageUrl,
      widget.booksModel.price.toString(),
      widget.booksModel.rate.toString(),
    ];
    const List<TextInputType> textInputTypesData = [
      bookNameType,
      authorType,
      categoryType,
      descriptionType,
      imageUrlType,
      priceType,
      rateType,
    ];

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "Обновить книгу",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(
                        oldBook.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: TextField(
                              textInputAction: index == 6
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              readOnly: false,
                              enabled: true,
                              maxLines: 1,
                              onChanged: (value) {
                                changeData[index] = value;
                              },
                              onSubmitted: (v) {
                                changeData[index] = v;
                                if (kDebugMode) {
                                  print("Current: ${oldBook[index]}");
                                }
                              },
                              keyboardType: textInputTypesData[index],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText: oldBook[index],
                                hintStyle: AppTextStyle.interMedium,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ZoomTapAnimation(
                        onTap: () async {
                          Future.delayed(const Duration(seconds: 3));
                          BooksModel book = BooksModel(
                            bookName: changeData[0] == ''
                                ? widget.booksModel.bookName
                                : changeData[0],
                            author: changeData[1] == ''
                                ? widget.booksModel.author
                                : changeData[1],
                            bookCategory: changeData[2] == ''
                                ? widget.booksModel.bookCategory
                                : changeData[2],
                            description: changeData[3] == ''
                                ? widget.booksModel.description
                                : changeData[3],
                            imageUrl: changeData[4] == ''
                                ? widget.booksModel.imageUrl
                                : changeData[4],
                            price: int.parse(changeData[5] == ''
                                ? widget.booksModel.price.toString()
                                : changeData[5]),
                            rate: double.parse(
                              changeData[6] == ''
                                  ? widget.booksModel.rate.toString()
                                  : changeData[6],
                            ),
                            uuid: widget.booksModel.uuid,
                            categoryId: 0,
                          );
                          await context.read<BookViewModel>().updateBook(book);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "SUCCESS",
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.lightBlue,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                          child: Text(
                            " Сохронить",
                            style: AppTextStyle.interBold.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
