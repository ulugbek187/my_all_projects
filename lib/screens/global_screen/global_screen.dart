import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/blocs/product_bloc.dart';
import 'package:my_all_projects/blocs/product_event.dart';
import 'package:my_all_projects/blocs/product_state.dart';
import 'package:my_all_projects/data/api_provider/api_provider.dart';
import 'package:my_all_projects/data/models/products/products_model.dart';
import 'package:my_all_projects/screens/global_screen/widgets/product_item.dart';
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
              await ApiProvider.addStaticProducts(bookModel);
              if (context.mounted) {
                context.read<ProductBloc>().add(
                      GetProductEvent(),
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
          body: BlocConsumer<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductErrorState) {
                  return Center(
                    child: Text(state.errorText),
                  );
                }

                if (state is ProductSuccessState) {
                  return RefreshIndicator(
                    onRefresh: () {
                      return Future<void>.delayed(
                        const Duration(
                          seconds: 2,
                        ),
                        () {
                          context.read<ProductBloc>().add(
                                GetProductEvent(),
                              );
                        },
                      );
                    },
                    child: ListView(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 100.w, vertical: 5.h),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5 .h),
                            child: Column(
                              children: [
                                ...List.generate(
                                  state.product.length,
                                      (index) {
                                    ProductModel book = state.product[index];
                                    return ProductsItem(
                                      onLongTap: () async {
                                        await ApiProvider.deleteStaticProducts(
                                          book.uuid!,
                                        );
                                        if (context.mounted) {
                                          context.read<ProductBloc>().add(
                                            GetProductEvent(),
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
                                SizedBox(height: 10.h,),
                              ]
                            ),
                          ),
                        )
                      ],
                    )
                  );
                }
                return const Center(child: Text("INITIAL"));
              },
              listener: (context, state) {})),
    );
  }
}


//List.generate(
//                         state.product.length,
//                         (index) {
//                           ProductModel book = state.product[index];
//                           return ProductsItem(
//                             onLongTap: () async {
//                               await ApiProvider.deleteStaticBook(
//                                 book.uuid!,
//                               );
//                               if (context.mounted) {
//                                 context.read<BooksBloc>().add(
//                                       GetBooksEvent(),
//                                     );
//                               }
//                             },
//                             linkPicture: book.imageUrl,
//                             bookName: book.productName,
//                             author: book.author,
//                             categoryName: book.categoryName,
//                             rate: book.rate,
//                             price: book.price,
//                             onTap: () {},
//                           );
//                         },
//                       ),