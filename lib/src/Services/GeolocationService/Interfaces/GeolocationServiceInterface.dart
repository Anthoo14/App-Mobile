import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

abstract class GeolocationService{
Future<Result<PositionEntity, Failure>>  getCurrentPosition();
 Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class GeolocationServiceHelper{
  double getDistanceBetweenInMetters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude);
  double getDistanceBetweenInKilometters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude);

}