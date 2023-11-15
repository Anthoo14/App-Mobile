import 'package:flutter_vscode/src/Base/ApiService/apiService.dart';
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/RealtimeDatabase/Interfaces/interfaces.dart';

abstract class RealtimeDatabaseExceptions {
  static const String socketExceptionMessage = "No Internet connection 😑";
  static const String httpException = "Couldn't find the path 😱";
  static const String formatException = "Bad response format 👎";
}

class DefaultRealtimeDatabaseService extends RealtimeDatabaseService{

  final ApiService _apiService;

  DefaultRealtimeDatabaseService({ApiService? apiService}) : _apiService = apiService ?? DefaultApiService();

  @override
  //method get
  Future<Map<String, dynamic>> getData({required String path}) async{

    var endpoint = baseUrl + path + endUrl;
    try{
      final result = await _apiService.getDataFromGetRequest(endpoint: endpoint);
      return result;
    } on Failure catch (f){
      switch (f.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return f.error;
      }
    }
  }

  @override
  //method post
  Future<Map<String, dynamic>> postData({required Map<String, dynamic> bodyparameters, required String path}) async{
    var endpoint = baseUrl + path + endUrl;
    try{
      final result =await _apiService.getDataFromPostRequest(bodyparameters: bodyparameters, endpoint: endpoint);
      return result;
    }on Failure catch (f){
      switch (f.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return f.error;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> putData({required Map<String, dynamic> bodyparameters, required String path})async {
    var endpoint = baseUrl + path + endUrl;
    try{
      final result =await _apiService.getDataFromPutRequest(bodyparameters: bodyparameters, endpoint: endpoint);
      return result;
    }on Failure catch (f){
      switch (f.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return f.error;
      }
    }
  }
}