import 'dart:convert';

class SignUpEntity {
  SignUpEntity({
    this.localId,
    this.role,
    this.username,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.startDate,
    this.photo,
    this.shippingAddress,
    this.billingAddress,
    this.idToken,
  });

  String? localId;
  String? role;
  String? username;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? startDate;
  String? photo;
  String? shippingAddress;
  String? billingAddress;
  String? idToken;

  factory SignUpEntity.fromJson(String str) =>
      SignUpEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpEntity.fromMap(Map<String, dynamic> json) => SignUpEntity(
    localId: json["localId"] == null ? null : json["localId"],
    role: json["role"] == null ? null : json["role"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    dateOfBirth: json["dateOfBirth"] == null ? null : json["dateOfBirth"],
    startDate: json["startDate"] == null ? null : json["startDate"],
    photo: json["photo"] == null ? null : json["photo"],
    shippingAddress: json["shippingAddress"] == null ? null : json["shippingAddress"],
    billingAddress: json["billingAddress"] == null ? null : json["billingAddress"],
    idToken: json["idToken"] == null ? null : json["idToken"],
  );

  Map<String, dynamic> toMap() => {
    "localId": localId,
    "role": role,
    "username": username,
    "email": email,
    "phone": phone,
    "dateOfBirth": dateOfBirth,
    "startDate": startDate,
    "photo": photo,
    "shippingAddress": shippingAddress,
    "billingAddress": billingAddress,
    "idToken": idToken,
  };
}

