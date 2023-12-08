
abstract class BaseRealTimeDataBaseFirebase {
  //TODO: Please change this url for yours. ;)
  String baseUrl =
      "https://delivery-app-thefix-default-rtdb.firebaseio.com/";
  //TODO: Please change this admin token for yours. ;)
  String adminToken = "AIzaSyBqxj-7bIFF0Mfd4dtilCkpElOgYw8-0ck";
  String endUrl = ".json";
}

abstract class RealtimeDataBaseService extends BaseRealTimeDataBaseFirebase {
  Future<Map<String, dynamic>> postData({ required Map<String, dynamic> bodyParameters, required String path });
  Future<Map<String, dynamic>> putData({ required Map<String, dynamic> bodyParameters, required String path });
  Future<Map<String, dynamic>> getData({ required String path });
}
