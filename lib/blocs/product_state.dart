

import 'package:my_all_projects/data/models/products/products_model.dart';

abstract class ProductState {}

class ProductSuccessState extends ProductState {
  final List<ProductModel> product;

  ProductSuccessState({required this.product});
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  final String errorText;

  ProductErrorState(this.errorText);
}
