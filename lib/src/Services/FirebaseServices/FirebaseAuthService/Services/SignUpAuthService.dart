import '../Interfaces/Interfaces.dart';

class DefaultSignUpService extends SignUpService {
  @override
  Future<Map<String,dynamic>> signUp({required Map<String,dynamic> bodyParameters}) async {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }
}