import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Features/Domain/UseCases/Geolocation/GeolocationUseCaseParams.dart';
import 'package:delivery/src/Services/GeolocationService/Entities/GeoServiceEntities.dart';
import 'package:delivery/src/Services/GeolocationService/Interfaces/GeoServiceInterfaces.dart';
import 'package:delivery/src/Services/GeolocationService/Services/GeolocationHelpersService.dart';
import 'package:delivery/src/Services/GeolocationService/Services/GeolocationService.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import '../../../../Utils/Helpers/Logger/Logger.dart';

abstract class GeolocationUseCase {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
  Future<double> getDistanceBetweenYourCurrentPositionAnd(Destination destination);
}

class DefaultGeolocationUseCase extends GeolocationUseCase {
  // Dependencies
  final GeolocationService _geolocationService;
  final GeolocationHelpersService _geolocationHelpersService;

  DefaultGeolocationUseCase({ GeolocationService? geolocationService,
                              GeolocationHelpersService? geolocationHelpersService })
                       : _geolocationService = geolocationService ?? DefaultGeolocationService(), // Bueno: DefaultGeolocationService() Mock: MockSuccessGeolocationService
                         _geolocationHelpersService = geolocationHelpersService ?? DefaultGeolocationHelpersService();

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() {
    return _geolocationService.getCurrentPosition();
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    final status = await _geolocationService.getPermissionStatus();
    Logger.printMessageOnConsole("$status", "LocationPermission");
    return status;
  }

  @override
  Future<double> getDistanceBetweenYourCurrentPositionAnd(Destination destination) async {
    final currentPosition = await _geolocationService.getCurrentPosition();
    final distance = _geolocationHelpersService.getDistanceBetweenInKilometters(currentPosition.value?.latitude ?? 0.0,
                                                                                currentPosition.value?.longitude ?? 0.0,
                                                                                destination.destinationLatitude,
                                                                                destination.destinationLongitude);
    return distance;
  }
}