import '../Interfaces/AuthFirebase.dart';

class DefaultGetUserAuthDataService extends GetUserAuthDataService{
  @override
  Future<Map<String, dynamic>> getUserAuthData({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyparameters: bodyParameters, endpoint: endpoint);
  }
  
}