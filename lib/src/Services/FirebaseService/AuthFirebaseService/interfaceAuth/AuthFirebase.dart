
import 'dart:convert';

import 'package:flutter_vscode/src/Base/ApiService/apiService.dart';

abstract class BaseFirebaseService{
  ApiService apiService = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String singUpEndpoint = "accounts:signUp?key=";
  static String singInEndpoint = "accounts:signInWithPassword?key=";
  static String admToken = "AIzaSyBqxj-7bIFF0Mfd4dtilCkpElOgYw8-0ck";
}

abstract class SingUpService extends BaseFirebaseService{
  String endpoint= BaseFirebaseService.baseUrl+BaseFirebaseService.singUpEndpoint+BaseFirebaseService.admToken;
  Future<Map <String,dynamic>> singUp({required Map <String,dynamic> bodyParameters});

}

abstract class SingInService extends BaseFirebaseService{
  String endpoint= BaseFirebaseService.baseUrl+BaseFirebaseService.singInEndpoint+BaseFirebaseService.admToken;
  Future<Map <String,dynamic>> singIn({required Map <String,dynamic> bodyParameters});
}