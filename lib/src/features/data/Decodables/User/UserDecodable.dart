import 'dart:convert';

class UserDecodable{
  UserDecodable({
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
      this.idToken});

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



  factory UserDecodable.fromJson(String str)=>
      UserDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDecodable.fromMap(Map<String, dynamic>json)=> UserDecodable(
      localId :json["localId"]==null ?null : json["localId"],
      role :json["role"]==null ?null : json["role"],
      username  :json["username"]==null ?null : json["username"],
      email  :json["email"]==null ?null : json["email"],
      phone  :json["phone"]==null ?null : json["phone"],
      dateOfBirth  :json["dateOfBirth"]==null ?null : json["dateOfBirth"],
      startDate  :json["startDate"]==null ?null : json["startDate"],
      photo  :json["photo"]==null ?null : json["photo"],
      shippingAddress  :json["shippingAddress"]==null ?null : json["shippingAddress"],
      billingAddress  :json["billingAddress"]==null ?null : json["billingAddress"],
      idToken  :json["idToken"]==null ?null : json["idToken"]
  );


  Map<String,dynamic> toMap() =>{
    "localId": localId ==null ?null :localId,
    "role": role ==null ?null :role,
    "username": username ==null ?null :username,
    "email": email ==null ?null :email,
    "phone": phone ==null ?null :phone,
    "dateOfBirth": dateOfBirth ==null ?null :dateOfBirth,
    "photo": photo ==null ?null :photo,
    "shippingAddress": shippingAddress ==null ?null :shippingAddress,
    "billingAddress": billingAddress ==null ?null :billingAddress,
    "idToken": idToken ==null ?null :idToken

  };
}