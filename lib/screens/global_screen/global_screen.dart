import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/blocs/books_bloc.dart';
import 'package:my_all_projects/blocs/books_event.dart';
import 'package:my_all_projects/blocs/books_state.dart';
import 'package:my_all_projects/data/api_provider/api_provider.dart';
import 'package:my_all_projects/data/models/products/products_model.dart';
import 'package:my_all_projects/screens/global_screen/widgets/book_item.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
          floatingActionButton: FloatingActionButton.small(
            onPressed: () async {
              ProductModel bookModel = ProductModel(
                productName: 'Iphone 15 pro max',
                author: 'Tim Kuk',
                categoryName: 'Apple',
                description: 'This phone is very beautiful',
                imageUrl:
                    'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR9r4mU-_CVgpKt9nCaPjP_DWawo6a490utL0jtOp9fmzpGKbdMlehLk_XXAb-I1msgvKSy-J9L5sWEAWdlXkq2VuLB-6_h0B11BUld1aVDIPAXvD2Js9opDvb6mK3SybPGmy6x7A&usqp=CAc',
                price: '250000',
                rate: '5.0',
              );
              await ApiProvider.addStaticBook(bookModel);
              if (context.mounted) {
                context.read<BooksBloc>().add(
                      GetBooksEvent(),
                    );
              }
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 20.w,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Products',
              style: AppTextStyle.interBold,
            ),
          ),
          body: BlocConsumer<BooksBloc, BooksState>(
              builder: (context, state) {
                if (state is BooksLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is BooksErrorState) {
                  return Center(
                    child: Text(state.errorText),
                  );
                }

                if (state is BooksSuccessState) {
                  return RefreshIndicator(
                    onRefresh: () {
                      return Future<void>.delayed(
                        const Duration(
                          seconds: 2,
                        ),
                        () {
                          context.read<BooksBloc>().add(
                                GetBooksEvent(),
                              );
                        },
                      );
                    },
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      primary: false,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.45,
                      children: List.generate(
                        state.product.length,
                        (index) {
                          ProductModel book = state.product[index];
                          return ProductsItem(
                            onLongTap: () async {
                              await ApiProvider.deleteStaticBook(
                                book.uuid!,
                              );
                              if (context.mounted) {
                                context.read<BooksBloc>().add(
                                      GetBooksEvent(),
                                    );
                              }
                            },
                            linkPicture: book.imageUrl,
                            bookName: book.productName,
                            author: book.author,
                            categoryName: book.categoryName,
                            rate: book.rate,
                            price: book.price,
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  );
                }
                return const Center(child: Text("INITIAL"));
              },
              listener: (context, state) {})),
    );
  }
}
