import 'dart:convert';
import 'dart:io';

import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:http/http.dart' as http;

abstract class _Exceptions {
  static String socketExceptionMessage = "No internet connection.";
  static String hhtpException = "Couldn't find the path";
  static String formatException = "Bad response format";
}

abstract class ApiService {
  Future<Map<String, dynamic>> getDataFromPostRequest({required Map<String, dynamic> bodyparameters, required String endpoint, Map<String, String>? headers});

  Future<Map<String, dynamic>> getDataFromPutRequest({required Map<String, dynamic> bodyparameters, required String endpoint, Map<String, String>? headers});

  Future<Map<String, dynamic>> getDataFromGetRequest({required String endpoint, Map<String, String>? headers});}

class DefaultApiService extends ApiService {
  @override
  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String endpoint, Map<String, String>? headers}) async {
    var _endpoint = Uri.parse(endpoint);
    var response = await http.get(_endpoint, headers: headers);
    try {
      if (response.statusCode.toString().contains('20')) {
        //good
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        //error
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.hhtpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyparameters,
      required String endpoint,
      Map<String, String>? headers}) async {
    final body = json.encode(bodyparameters);
    final _endpoint = Uri.parse(endpoint);
    final response = await http.post(_endpoint, headers: headers, body: body);
    try {
      if (response.statusCode.toString().contains('20')) {
        //good
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        //error
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.hhtpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyparameters,
      required String endpoint,
      Map<String, String>? headers}) async {
    final body = json.encode(bodyparameters);
    final _endpoint = Uri.parse(endpoint);
    final response = await http.put(_endpoint, headers: headers, body: body);
    try {
      if (response.statusCode.toString().contains('20')) {
        //good
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        //error
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.hhtpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }
}
