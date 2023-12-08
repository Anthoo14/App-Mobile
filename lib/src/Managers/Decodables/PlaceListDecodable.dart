
import 'dart:convert';

class PlaceListDecodable {
  PlaceListDecodable({
    required this.placeList,
  });
  List<PlaceList>? placeList;
  factory PlaceListDecodable.fromJson(String str) => PlaceListDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceListDecodable.fromMap(Map<String, dynamic> json) => PlaceListDecodable(
    placeList: json["placeList"] == null ? null : List<PlaceList>.from(json["placeList"].map((x) => PlaceList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "placeList": placeList == null ? null : List<dynamic>.from(placeList!.map((x) => x.toMap())),
  };
}


class PlaceList {
  final String address;
  final String adminId;
  final String city;
  final int collectionId;
  final String country;
  final String description;
  final String email;
  final List<String> favourites;
  final List<String> imgs;
  final double lat;
  final double long;
  final String phoneNumber;
  final String placeId;
  final String placeName;
  final int ratings;
  final double ratingAverage;
  final String zipCode;
  final String status;
  final bool isPopularThisWeek;
  final bool isNovelty;
  final bool hasFreeDelivery;
  final bool hasAlcohol;
  final bool isOpenNow;
  final int averagePrice;

  PlaceList({
    required this.address,
    required this.adminId,
    required this.city,
    required this.collectionId,
    required this.country,
    required this.description,
    required this.email,
    required this.favourites,
    required this.imgs,
    required this.lat,
    required this.long,
    required this.phoneNumber,
    required this.placeId,
    required this.placeName,
    required this.ratings,
    required this.ratingAverage,
    required this.zipCode,
    required this.status,
    required this.isPopularThisWeek,
    required this.isNovelty,
    required this.hasFreeDelivery,
    required this.hasAlcohol,
    required this.isOpenNow,
    required this.averagePrice,
  });

  factory PlaceList.fromJson(String str) => PlaceList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceList.fromMap(Map<String, dynamic> json) => PlaceList(
    address: json["address"],
    adminId: json["adminId"],
    city: json["city"],
    collectionId: json["collectionId"],
    country: json["country"],
    description: json["description"],
    email: json["email"],
    favourites: List<String>.from(json["favourites"].map((x) => x)),
    imgs: List<String>.from(json["imgs"].map((x) => x)),
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    phoneNumber: json["phoneNumber"],
    placeId: json["placeId"],
    placeName: json["placeName"],
    ratings: json["ratings"],
    ratingAverage: json["ratingAverage"].toDouble(),
    zipCode: json["zipCode"],
    status: json["status"],
    isPopularThisWeek: json["isPopularThisWeek"],
    isNovelty: json["isNovelty"],
    hasFreeDelivery: json["hasFreeDelivery"],
    hasAlcohol: json["hasAlcohol"],
    isOpenNow: json["isOpenNow"],
    averagePrice: json["averagePrice"],
  );

  Map<String, dynamic> toMap() => {
    "address": address,
    "adminId": adminId,
    "city": city,
    "collectionId": collectionId,
    "country": country,
    "description": description,
    "email": email,
    "favourites": List<dynamic>.from(favourites.map((x) => x)),
    "imgs": List<dynamic>.from(imgs.map((x) => x)),
    "lat": lat,
    "long": long,
    "phoneNumber": phoneNumber,
    "placeId": placeId,
    "placeName": placeName,
    "ratings": ratings,
    "ratingAverage": ratingAverage,
    "zipCode": zipCode,
    "status": status,
    "isPopularThisWeek": isPopularThisWeek,
    "isNovelty": isNovelty,
    "hasFreeDelivery": hasFreeDelivery,
    "hasAlcohol": hasAlcohol,
    "isOpenNow": isOpenNow,
    "averagePrice": averagePrice,
  };
}
