import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/blocs/product_event.dart';
import 'package:my_all_projects/blocs/product_state.dart';
import 'package:my_all_projects/data/models/products/products_model.dart';
import 'package:my_all_projects/data/repositories/books_repository.dart';
import '../data/api_provider/api_provider.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.booksRepository}) : super(ProductInitialState()) {
    on<GetProductEvent>(_getProduct);
  }

  final BooksRepository booksRepository;
}

Future<void> _getProduct(
  GetProductEvent event,
  Emitter<ProductState> emit,
) async {
  emit(ProductLoadingState());
  await Future.delayed(const Duration(seconds: 3));
  ApiProvider apiProvider = ApiProvider();
  BooksRepository booksRepository = BooksRepository(
    apiProvider: apiProvider,
  );
  var response = await booksRepository.getProduct();
  if (response.errorText.isNotEmpty) {
    emit(ProductErrorState(response.errorText));
  } else {
    emit(ProductSuccessState(product: response.data as List<ProductModel>));
  }
}
