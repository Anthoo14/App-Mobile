import 'dart:convert';

class UpdatePassDecodable {
  String? email;
  String? kind;
  UpdatePassDecodable({
    this.email,
    this.kind
  });

  factory UpdatePassDecodable.fromJson(String str) => UpdatePassDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePassDecodable.fromMap(Map<String, dynamic> json) => UpdatePassDecodable(
    email: json["email"],
    kind: json["kind"],
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "kind" :kind
  };
}
