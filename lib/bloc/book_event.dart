import 'package:equatable/equatable.dart';
import 'package:my_all_projects/data/model/book_model.dart';
import 'package:my_all_projects/data/model/category_model.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}

class CategoryBooksEvent extends BookEvent {
  const CategoryBooksEvent({required this.categoryModel, required this.books});

  final CategoryModel categoryModel;
  final List<BookModel> books;

  @override
  List<Object?> get props => [books];
}

class SearchBooksEvent extends BookEvent {
  const SearchBooksEvent({required this.searchBooks, required this.value});

  final String value;
  final List<BookModel> searchBooks;

  @override
  List<Object?> get props => [searchBooks];
}

class DownLoadEvent extends BookEvent {
  const DownLoadEvent({required this.bookModel});

  final BookModel bookModel;

  @override
  List<Object?> get props => [bookModel];
}
