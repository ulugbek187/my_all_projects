
import 'package:my_all_projects/data/models/person_model/person_model.dart';
import '../network/api_provider.dart';

class SecondRepo {
  Future<List<PersonModel>> getAllUserData() => ApiProvider.getAllUserData();
}
