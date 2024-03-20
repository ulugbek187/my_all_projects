import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/book_model.dart';
import 'package:my_all_projects/screens/update/update_screen.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';
import 'package:my_all_projects/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.bookModel});

  final BooksModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Книга: ${bookModel.bookName}",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: bookModel.imageUrl,
              placeholder: (context, imageUrl) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, imageUrl, error) =>
                  const Icon(Icons.error),
              width: 250.w,
              height: 300.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  bookModel.bookName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "${bookModel.price.toString()} ₽",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Писатель:  ${bookModel.author}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Оценка читателей: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  bookModel.rate.toString(),
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                  "★",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Описание книги",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              bookModel.description,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.sp,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateScreen(booksModel: bookModel,),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text(
                            "Вы действительно хотитие удалить эту книгу?"),
                        titleTextStyle: AppTextStyle.interBold.copyWith(
                          color: AppColors.black,
                          fontSize: 20.sp,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'нет',
                              style: AppTextStyle.interBold
                                  .copyWith(color: AppColors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              context.read<BookViewModel>().deleteBook(
                                    bookUUID: bookModel.uuid!,
                                  );
                              Future.delayed(
                                const Duration(seconds: 1),
                              );
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Удалено!",
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Text(
                              'дa',
                              style: AppTextStyle.interBold.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//() async {
//                   context.read<BookViewModel>().deleteBook(
//                         bookUUID: bookModel.uuid,
//                       );
//                   Navigator.pop(context);
//                 },
