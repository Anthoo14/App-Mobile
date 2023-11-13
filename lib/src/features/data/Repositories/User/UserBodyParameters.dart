class UserBodyParameters{



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

UserBodyParameters(
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
      this.idToken);

  Map<String,dynamic> toMap() =>{
  "localId": localId ==null ?null :localId,
  "role": localId ==null ?null :role,
  "username": localId ==null ?null :username,
  "email": localId ==null ?null :email,
  "phone": localId ==null ?null :phone,
  "dateOfBirth": localId ==null ?null :dateOfBirth,
  "photo": localId ==null ?null :photo,
  "shippingAddress": localId ==null ?null :shippingAddress,
  "billingAddress": localId ==null ?null :billingAddress,
  "idToken": localId ==null ?null :idToken

};
}