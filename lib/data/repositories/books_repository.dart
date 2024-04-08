import '../api_provider/api_provider.dart';
import '../response/my_response.dart';

class BooksRepository {
  BooksRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<MyResponse> getBooks() => apiProvider.getBooks();
}
