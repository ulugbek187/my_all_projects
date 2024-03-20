
import 'package:my_all_projects/data/models/book_model.dart';
import 'package:my_all_projects/data/models/my_response.dart';
import 'package:my_all_projects/data/network/api_provider.dart';

class Repository {
  Future<MyResponse> getAllBooks() => ApiProvider.getAllBooks();

  Future<MyResponse> addBook(BooksModel bookModel) =>
      ApiProvider.addBook(bookModel);

  Future<MyResponse> deleteBook(String bookUUID) =>
      ApiProvider.deleteBook(bookUUID);

  Future<MyResponse> updateBook(BooksModel bookModel) =>
      ApiProvider.updateBook(bookModel);
}
