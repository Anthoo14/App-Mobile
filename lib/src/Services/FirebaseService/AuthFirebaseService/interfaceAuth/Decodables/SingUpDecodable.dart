import 'dart:convert';

class SingUpDecodable {
  String? kind;
  String ?idToken;
  String ?email;
  String ?refreshToken;
  String ?expiresIn;
  String ?localId;

  SingUpDecodable({
    this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  factory SingUpDecodable.fromRawJson(String str) => SingUpDecodable.fromJson(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory SingUpDecodable.fromJson(Map<String, dynamic> json) => SingUpDecodable(
    kind: json["kind"],
    idToken: json["idToken"],
    email: json["email"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
    localId: json["localId"],
  );

  Map<String, dynamic> toMap() => {
    "kind": kind,
    "idToken": idToken,
    "email": email,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
    "localId": localId,
  };
}
