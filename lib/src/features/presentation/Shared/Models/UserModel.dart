import 'dart:convert';

class UserModel {
  UserModel({
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

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    localId: json["localId"],
    role: json["role"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    dateOfBirth: json["dateOfBirth"],
    startDate: json["startDate"],
    photo: json["photo"],
    shippingAddress: json["shippingAddress"],
    billingAddress: json["billingAddress"],
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
  };
}
