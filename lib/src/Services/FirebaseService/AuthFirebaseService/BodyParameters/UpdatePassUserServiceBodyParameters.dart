import 'dart:convert';

class UpdatePassBodyParameters {

  UpdatePassBodyParameters({
    required this.requestType,
    required this.email,
  });

  String requestType;
  String email;

  factory UpdatePassBodyParameters.fromJson(String str) => UpdatePassBodyParameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePassBodyParameters.fromMap(Map<String, dynamic> json) => UpdatePassBodyParameters(
    requestType: json["requestType"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "requestType": requestType,
    "email": email,
  };
}
