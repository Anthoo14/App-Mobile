import 'dart:convert';

class CorrectPostBodyParameters {
  String? title;
  String? body;
  int? userId;

  CorrectPostBodyParameters({
    this.title,
    this.body,
    this.userId,
  });

  factory CorrectPostBodyParameters.fromRawJson(String str) =>
      CorrectPostBodyParameters.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory CorrectPostBodyParameters.fromMap(Map<String, dynamic> json) =>
      CorrectPostBodyParameters(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}


class CorrectPutBodyParameters {
  String? id;
  String? title;
  String? body;
  int? userId;

  CorrectPutBodyParameters({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  factory CorrectPutBodyParameters.fromRawJson(String str) => CorrectPutBodyParameters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory CorrectPutBodyParameters.fromJson(Map<String, dynamic> json) => CorrectPutBodyParameters(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "body": body,
    "userId": userId,
  };
}

