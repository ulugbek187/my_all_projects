import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/book_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
import '../../view_models/book_view_model.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({
    super.key,
  });

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

List<String> newBook = [
  "",
  "",
  "",
  "",
  "",
  "",
  "",
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

bool isValid = true;
const TextInputType bookNameType = TextInputType.text;
const TextInputType authorType = TextInputType.text;
const TextInputType categoryType = TextInputType.text;
const TextInputType descriptionType = TextInputType.text;
const TextInputType imageUrlType = TextInputType.text;
const TextInputType priceType = TextInputType.number;
const TextInputType rateType = TextInputType.number;

class _AddBookScreenState extends State<AddBookScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 2.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20.w,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "Добавить книгу",
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ...List.generate(
                      titles.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 20.w,
                          ),
                          child: TextField(
                            textInputAction: index == 6
                                ? TextInputAction.done
                                : TextInputAction.next,
                            readOnly: false,
                            enabled: true,
                            maxLines: 1,
                            onChanged: (value) {
                              newBook[index] = value;
                            },
                            onSubmitted: (v) {
                              newBook[index] = v;
                              if (kDebugMode) {
                                print("Current: ${newBook[index]}");
                              }
                            },
                            keyboardType: textInputTypesData[index],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(16),
                              hintText: titles[index],
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
                        Future.delayed(
                          const Duration(
                            seconds: 3,
                          ),
                        );
                        for (int i = 0; i < titles.length; i++) {
                          if (newBook[i].isEmpty) {
                            isValid = false;
                          } else {
                            isValid = true;
                          }
                          if (kDebugMode) {
                            print(
                              "==================================${newBook[i]}\n",
                            );
                          }
                        }

                        if (isValid == true) {
                          BooksModel book = BooksModel(
                            bookName: newBook[0],
                            author: newBook[1],
                            bookCategory: newBook[2],
                            description: newBook[3],
                            imageUrl: newBook[4],
                            price: int.parse(newBook[5]),
                            rate: double.parse(newBook[6]), categoryId: 1,
                          );
                          await context.read<BookViewModel>().addBook(book);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Вы не заполнили какую-то строку!!!",
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        }
                        if (context.mounted) {
                          isValid ? Navigator.pop(context) : null;
                        }
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Сохраненно",
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
                          "Сохронить",
                          style: AppTextStyle.interBold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> titles = [
  "Kitob nomi",
  "Muallifi",
  "Kategoriya nomi",
  "Izoh",
  "Rasm linki",
  "Narxi",
  "Bahosi",
];
