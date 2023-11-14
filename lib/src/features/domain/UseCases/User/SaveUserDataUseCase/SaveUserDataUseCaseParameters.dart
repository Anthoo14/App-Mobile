

import '../../../Entities/User/UserEntity.dart';

class SaveUserDataUseCaseParameters{
  String? localId;
  UserRole? role;
  String? username;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? startDate;
  String? photo;
  String? shippingAddress;
  String? billingAddress;
  String? idToken;

  SaveUserDataUseCaseParameters({
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
      this.idToken,} );


  Map<String,dynamic> toMap() =>{
  "localId": localId,
  "role":role,
  "username":username,
  "email":email,
  "phone":phone,
  "dateOfBirth" :dateOfBirth,
  "photo":photo,
  "shippingAddress":shippingAddress,
  "billingAddress":billingAddress,
  "idToken":idToken

  };
}