

import 'package:my_all_projects/data/models/products/products_model.dart';

abstract class BooksState {}

class BooksSuccessState extends BooksState {
  final List<ProductModel> product;

  BooksSuccessState({required this.product});
}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class BooksErrorState extends BooksState {
  final String errorText;

  BooksErrorState(this.errorText);
}
