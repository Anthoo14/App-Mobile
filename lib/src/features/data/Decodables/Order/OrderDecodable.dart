import 'package:delivery/src/Features/Data/Decodables/DeliveryAddress/DeliveryAddressDecodable.dart';
import 'package:delivery/src/Features/Data/Decodables/PaymentMethods/PaymentMethodsDecodable.dart';
import 'package:delivery/src/Managers/Places/Decodables/PlaceList/PlaceListDecodable.dart';

class OrderDecodable {
    String orderId;
    String placeId;
    String userId;
    double totalAmount;
    double deliveryFee;
    double fee;
    bool needCutlery;
    String status;
    DeliveryAddressDecodable deliveryAddress;
    PaymentMethodDecodable paymentMethod;
    List<PlaceProductDecodable> products;

    OrderDecodable({
        required this.orderId,
        required this.placeId,
        required this.userId,
        required this.totalAmount,
        required this.deliveryFee,
        required this.fee,
        required this.needCutlery,
        required this.status,
        required this.deliveryAddress,
        required this.paymentMethod,
        required this.products,
    });

    factory OrderDecodable.fromJson(Map<String, dynamic> json) => OrderDecodable(
        orderId: json["orderId"],
        placeId: json["placeId"],
        userId: json["userId"],
        totalAmount: json["totalAmount"]?.toDouble(),
        deliveryFee: json["deliveryFee"]?.toDouble(),
        fee: json["fee"]?.toDouble(),
        needCutlery: json["needCutlery"],
        status: json["status"],
        deliveryAddress: DeliveryAddressDecodable.fromMap(json["deliveryAddress"]),
        paymentMethod: PaymentMethodDecodable.fromMap(json["paymentMethod"]),
        products: json["products"] == null ? [] : List<PlaceProductDecodable>.from(json["products"]!.map((x) => PlaceProductDecodable.fromJson(x)))
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "placeId": placeId,
        "userId": userId,
        "totalAmount": totalAmount,
        "deliveryFee": deliveryFee,
        "fee": fee,
        "needCutlery": needCutlery,
        "status": status,
        "deliveryAddress": deliveryAddress.toMap(),
        "paymentMethod": paymentMethod.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}