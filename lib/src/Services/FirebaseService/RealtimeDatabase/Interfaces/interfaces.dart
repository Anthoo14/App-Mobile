abstract class BaseRealtimeDatabaseService{
  String baseUrl = "https://delivery-app-thefix-default-rtdb.firebaseio.com/";
  String admintoken = "";
  String endUrl = ".json";


}
abstract class RealtimeDatabaseService extends BaseRealtimeDatabaseService{
 Future< Map<String,dynamic>> postData({required Map<String, dynamic> bodyparameters,required String path});

 Future< Map<String,dynamic>> putData({required Map<String, dynamic> bodyparameters,required String path});
 Future< Map<String,dynamic>> getData({required String path});
}