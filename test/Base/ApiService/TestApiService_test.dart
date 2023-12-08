import 'package:delivery/src/Base/ApiService/ApiService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'Mocks/TestApiMocks.dart';

abstract class _Constants {
  static Map<String,String> defaultHeaders = {'Content-type': 'application/json; charset=UTF-8' };
  static String postEndpoint = "https://jsonplaceholder.typicode.com/posts";
  static String getEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
  static String putEndpoint = "https://jsonplaceholder.typicode.com/posts/1";
}

void main() {
  final ApiService sut = DefaultApiService();

  group('Test correct Connection', () {

    // Test correct post connection to json placeholder
    test('Test correct post connection to jsonplaceholder', () async {

      final params = CorrectPostBodyParams(title: "foo", body: "bar", userId: 1);
      final result = await sut.getDataFromPostRequest(bodyParameters: params.toMap(), url: _Constants.postEndpoint, headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });

    // Test correct get connection to json placeholder
    test('Test correct get connection to json placeholder', () async {
      final result = await sut.getDataFromGetRequest(url: _Constants.getEndpoint);

      expect(result, Map.from(result));
    });

    // Test correct put connection to json placeholder
     test('Test correct put connection to jsonplaceholder', () async {

        final params = CorrectPutBodyParams(id:1, title: "foo", body: "bar", userId: 1);
        final result = await sut.getDataFromPutRequest(bodyParameters: params.toMap(), url: _Constants.putEndpoint, headers: _Constants.defaultHeaders);

        expect(result, Map.from(result));
     });
  });
}

