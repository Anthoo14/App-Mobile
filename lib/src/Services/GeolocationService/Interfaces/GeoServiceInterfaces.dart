import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import '../Entities/GeoServiceEntities.dart';

abstract class GeolocationService {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class GeolocationHelpersService {
  double getDistanceBetweenInMetters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude);
  double getDistanceBetweenInKilometters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude);
}