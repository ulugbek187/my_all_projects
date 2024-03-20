
import 'package:my_all_projects/data/models/computer_models/network_responce.dart';
import 'package:my_all_projects/data/network/api_provider.dart';

class ComputerRepository {
  Future<NetworkResponse> getComputerDataById(int id) =>
      ApiProvider.fetchSingleComputersData(id);

  Future<NetworkResponse> getAllComputerData() =>
      ApiProvider.fetchAllComputersData();

  Future<NetworkResponse> getAllInfo(int id) =>
      ApiProvider.fetchSingleInfoProducts(id);
}
