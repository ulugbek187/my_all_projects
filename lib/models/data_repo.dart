import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_all_projects/models/subject_model.dart';
import 'package:my_all_projects/utils/images/app_images.dart';

class DataRepository {

  DataRepository._();

  static final DataRepository instance = DataRepository._();

  factory DataRepository() => instance;

  static List<SubjectModel> allSubject = [];

  Future<void> loadSubject() async {
    var data = await rootBundle.loadString(AppImages.data);
    var decodeData = jsonDecode(data);
    allSubject = (decodeData["data"] as List?)
        ?.map((e) => SubjectModel.fromJson(e))
        .toList() ??
        [];
  }
}
