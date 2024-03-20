import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/book_model.dart';
import 'package:my_all_projects/screens/global_widgets/search_text_field.dart';
import 'package:my_all_projects/screens/info_screen/info_screen.dart';
import 'package:my_all_projects/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class AllBookScreen extends StatelessWidget {
  const AllBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Все книги",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          ),
        ),
        body: context.watch<BookViewModel>().isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(seconds: 1),
                    () {
                      context.read<BookViewModel>().getAllBooks();
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      const TextFieldGo(
                        type: TextInputType.name,
                        hinText: "Search books",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ...List.generate(
                        context.watch<BookViewModel>().allBooks.length,
                        (index) {
                          BooksModel bookModel =
                              context.watch<BookViewModel>().allBooks[index];

                          return Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InfoScreen(bookModel: bookModel),
                                      ),
                                    );
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: bookModel.imageUrl,
                                    placeholder: (context, imageUrl) =>
                                        const Center(
                                            child: CircularProgressIndicator()),
                                    errorWidget: (context, imageUrl, error) =>
                                        const Icon(Icons.error),
                                    width: 350.w,
                                    height: 300.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    bookModel.bookName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    " ★",
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
