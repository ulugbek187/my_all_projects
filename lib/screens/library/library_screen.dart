import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/models/book_model.dart';
import 'package:my_all_projects/data/repositories/book_repo.dart';
import 'package:my_all_projects/screens/add_book/add_book_screen.dart';
import 'package:my_all_projects/screens/all_books_screen/all_books_screen.dart';
import 'package:my_all_projects/screens/global_widgets/search_text_field.dart';
import 'package:my_all_projects/screens/info_screen/info_screen.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';
import 'package:my_all_projects/view_models/book_view_model.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'widgets/items.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final Repository repository = Repository();

  // final TextEditingController usernameControler = TextEditingController();
  //
  // @override
  // void dispose() {
  //   usernameControler.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 36.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w,),
                        child: Text(
                          "Добро пожаловать",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.w,
                        ),
                        child: Text(
                          "ползователь 1",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: const TextFieldGo(
                          type: TextInputType.name,
                          hinText: "Search books",
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "Категории",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 30.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              context.watch<BookViewModel>().allBooks.length,
                              (index) {
                                BooksModel book = context
                                    .watch<BookViewModel>()
                                    .allBooks[index];
                                return ZoomTapAnimation(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      6.w,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                    child: Center(
                                      child: Text(
                                        book.bookCategory,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Рекомендации",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AllBookScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Все книги",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 190.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              context.watch<BookViewModel>().allBooks.length,
                              (index) {
                                BooksModel book = context
                                    .watch<BookViewModel>()
                                    .allBooks[index];
                                return GetItems(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InfoScreen(
                                          bookModel: book,
                                        ),
                                      ),
                                    );
                                    debugPrint(book.bookName);
                                  },
                                  imagePath: book.imageUrl,
                                  name: book.bookName,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddBookScreen(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: 20.w,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}

// context.watch<BookViewModel>().allBooks.length,
