import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:my_all_projects/data/models/my_response.dart';
import 'package:my_all_projects/data/repositories/book_repo.dart';

import '../data/models/book_model.dart';

class BookViewModel extends ChangeNotifier {
  List<BooksModel> allBooks = [];

  String statusText = "";

  bool isLoading = false;

  BookViewModel({required this.productRepo}) {
    getAllBooks();
  }

  final Repository productRepo;

  Future<void> getAllBooks() async {
    _notify(true);
    MyResponse myResponse = await productRepo.getAllBooks();
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BooksModel>;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> addBook(BooksModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await productRepo.addBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> updateBook(BooksModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await productRepo.updateBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> deleteBook({required String bookUUID}) async {
    _notify(true);
    MyResponse myResponse = await productRepo.deleteBook(bookUUID);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  _notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
