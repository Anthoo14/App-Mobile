import '../Interfaces/Interfaces.dart';

class DefaultGetUserDataService extends GetUserDataService {
  
  @override
  Future<Map<String, dynamic>> getUserData({ required Map<String, dynamic> bodyParameters }) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }

}