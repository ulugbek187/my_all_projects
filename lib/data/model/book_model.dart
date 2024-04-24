
import 'package:my_all_projects/data/model/category_model.dart';

class BookModel {
  BookModel({
    required this.bookName,
    required this.bookUrl,
    required this.imagePath,
    required this.categoryModel,
  });

  final String bookName;
  final String bookUrl;
  final String imagePath;
  final CategoryModel categoryModel;
}
