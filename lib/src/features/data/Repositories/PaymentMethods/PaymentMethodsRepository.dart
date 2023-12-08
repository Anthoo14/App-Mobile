import 'package:delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery/src/Features/Data/Decodables/PaymentMethods/PaymentMethodsDecodable.dart';
import '../../../../Base/AppError/AppError.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/Interfaces.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/RealtimeDataBaseService.dart';
import 'BodyParameters/PaymentMethodsBodyParameters.dart';

abstract class PaymentMethodsRepository {
  Future<PaymentMethodsDecodable> getPaymentMethods({ required String localId });
  Future<PaymentMethodsDecodable> savePaymentMethods({ required String localId, required PaymentMethodsBodyParameters bodyParameters });
}

class DefaultPaymentMethodsRepository extends PaymentMethodsRepository {

  final String _path = "paymentMethods/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultPaymentMethodsRepository({ RealtimeDataBaseService? realtimeDataBaseService })
      : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<PaymentMethodsDecodable> getPaymentMethods({ required String localId }) async {
    try {
      final response = await _realtimeDataBaseService.getData(path: _path + localId);
      return PaymentMethodsDecodable.fromMap(response);
    } on Failure catch(f) {
      if (f.message == RealtimeDatabaseExceptions.httpException) {
        return PaymentMethodsDecodable.getEmptyPaymentMethods();
      } else {
        return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
      }
    }
  }

  @override
  Future<PaymentMethodsDecodable> savePaymentMethods({ required String localId,
                                                       required PaymentMethodsBodyParameters bodyParameters }) async {
    var path = _path + localId;
    try {
      final result = await _realtimeDataBaseService.putData(bodyParameters: bodyParameters.toMap(), path: path);
      return PaymentMethodsDecodable.fromMap(result);
    } on Failure catch (f) {
      return Future.error(f.error);
    }
  }
}