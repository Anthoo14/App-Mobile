import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:flutter_vscode/src/Services/GeolocationService/Interfaces/GeolocationServiceInterface.dart';
import 'package:flutter_vscode/src/Services/GeolocationService/Mappers/GeolocationServiceMappers.dart';
import 'package:flutter_vscode/src/Services/GeolocationService/Service/GeolocationService.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';
import 'package:geolocator/geolocator.dart';


class MockGeolocationService extends GeolocationService{



  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition()async {

    final permissionStatus = await getPermissionStatus();
    if(permissionStatus == LocationPermissionStatus.allowed){
    var fakePosition =  Position(longitude: -14.078901,
        latitude: -75.725799,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        speed: 0.0,
        altitudeAccuracy:0.0 ,
        heading: 0.0,
        speedAccuracy: 0.0, headingAccuracy: 0.0);
    return Result.success(GeolocationServiceMapper.mapPosition(fakePosition));
  }else{
      return Future.error(GeolocationFailureMessage.locationPermissionsDenied);
    }
    }

  @override
  Future<LocationPermissionStatus> getPermissionStatus()async {
    return LocationPermissionStatus.allowed;
  }
}