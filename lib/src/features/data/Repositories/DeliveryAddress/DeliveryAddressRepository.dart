import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery/src/Features/Data/Decodables/DeliveryAddress/DeliveryAddressDecodable.dart';
import 'package:delivery/src/Features/Data/Repositories/DeliveryAddress/BodyParameters/DeliveryAddressBodyParameters.dart';
import 'package:delivery/src/Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/Interfaces.dart';
import 'package:delivery/src/Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/RealtimeDataBaseService.dart';

abstract class DeliveryAddressRepository {
  Future<DeliveryAddressListDecodable> getDeliveryAddressList({ required String localId });
  Future<DeliveryAddressListDecodable> saveDeliveryAddressList({ required String localId,
                                                                 required DeliveryAddressListBodyParameters bodyParameters });
}

class DefaultDeliveryAddressRepository extends DeliveryAddressRepository {

  final String _path = "deliveryAddressList/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultDeliveryAddressRepository({ RealtimeDataBaseService? realtimeDataBaseService })
      : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<DeliveryAddressListDecodable> getDeliveryAddressList({ required String localId }) async {
    try {
      final response = await _realtimeDataBaseService.getData(path: _path + localId);
      return DeliveryAddressListDecodable.fromMap(response);
    } on Failure catch(f) {
      if (f.message == RealtimeDatabaseExceptions.httpException) {
        return DeliveryAddressListDecodable.getEmptyPaymentMethods();
      } else {
        return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
      }
    }
  }

  @override
  Future<DeliveryAddressListDecodable> saveDeliveryAddressList({ required String localId,
                                                                 required DeliveryAddressListBodyParameters bodyParameters }) async {
    var path = _path + localId;
    try {
      final result = await _realtimeDataBaseService.putData(bodyParameters: bodyParameters.toMap(), path: path);
      return DeliveryAddressListDecodable.fromMap(result);
    } on Failure catch (f) {
      return Future.error(f.error);
    }
  }
}