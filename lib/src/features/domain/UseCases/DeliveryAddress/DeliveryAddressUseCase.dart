import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery/src/Features/Data/Repositories/DeliveryAddress/DeliveryAddressRepository.dart';
import 'package:delivery/src/Features/Domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';

abstract class DeliveryAddressUseCase {
  Future<DeliveryAddressListEntity> getDeliveryAddressList({ required String localId });
  Future<DeliveryAddressListEntity> saveDeliveryAddressList({ required String localId,
                                                              required DeliveryAddressListEntity parameters });
}

class DefaultDeliveryAddressUseCase extends DeliveryAddressUseCase {

  // * Dependencies
  final DeliveryAddressRepository _repository;

  DefaultDeliveryAddressUseCase({ DeliveryAddressRepository? repository })
      : _repository = repository ?? DefaultDeliveryAddressRepository();

  @override
  Future<DeliveryAddressListEntity> getDeliveryAddressList({ required String localId }) {
    return _repository.getDeliveryAddressList(localId: localId).then( (response) {
      return DeliveryAddressListEntity.fromMap(response.toMap());
    }, onError: (e) {
      return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
    });
  }

  @override
  Future<DeliveryAddressListEntity> saveDeliveryAddressList({ required String localId,
                                                              required DeliveryAddressListEntity parameters }) {
    return _repository.saveDeliveryAddressList(localId: localId,
                                               bodyParameters: parameters.getDeliveryAddressBodyParameters()).then( (response) {
      return DeliveryAddressListEntity.fromMap(response.toMap());
    }, onError: (e) {
      return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
    });
  }
}