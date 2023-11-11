import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vscode/src/Base/ApiService/apiService.dart';

import 'Mocks/testApiMocks.dart';

abstract class _Constants {
  static Map<String,String> defaultHeaders ={'Content-type': 'application/json; charset=UTF-8'};
  static String postEndpoint = 'https://jsonplaceholder.typicode.com/posts';
  static String putEndpoint = 'https://jsonplaceholder.typicode.com/posts/1';
  static String getEndpoint = 'https://jsonplaceholder.typicode.com/posts/1';
}

void main() {
  //Esta es la que vamos a testear
  final ApiService _testApiService = DefaultApiService();
  //Test correct ApiService.
  group("Test correct ApiService.", () {
//Test POST connection ti jsonplaceholder
    test("Test POST connection ti jsonplaceholder", () async {
      final bodyParameters =
          CorrectPostBodyParameters(title: "foo", body: "bar", userId: 1);
      final result = await _testApiService.getDataFromPostRequest(
          bodyparameters: bodyParameters.toMap(),
          endpoint: _Constants.postEndpoint,headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });

    test("test correct get connection to json placeholder", () async {
      final result = await _testApiService.getDataFromGetRequest(
          endpoint: _Constants.getEndpoint);

      expect(result, Map.from(result));
    });


    test("test correct PUT connection to json placeholder", () async {
      final body = CorrectPutBodyParameters(title: 'foo',body:'bar',userId:1);
      final result =await _testApiService.getDataFromPutRequest(bodyparameters: body.toMap(), endpoint: _Constants.putEndpoint,headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });

  });
}
