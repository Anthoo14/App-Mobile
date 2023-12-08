import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Services/GeolocationService/Entities/GeoServiceEntities.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import '../Interfaces/GeoServiceInterfaces.dart';
import 'package:geolocator/geolocator.dart';
import '../Mappers/GeolocationServiceMappers.dart';

abstract class GeoLocationFailureMessages {
  // Error Messages
  static String locationServicesDisabled = "Location services are disabled.";
  static String locationPermissionsDenied = "Location permissions are denied";
  static String locationPermissionsDeniedForever = "Location permissions are permanently denied, we cannot request permissions.";
}

class DefaultGeolocationService extends GeolocationService {

  /// Return current position of the user.
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {
    return await _determinePosition().then( (position) {
      return Result.success(GeolocationServiceMappers.mapPosition(position));
    }, onError: (e) {
      return Result.failure(Failure.fromMessage(message: e.toString()));
    });
  }

  /// Request permission for Geolocation in the App.
  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        return LocationPermissionStatus.denied;
      case LocationPermission.deniedForever:
        return LocationPermissionStatus.deniedForever;
      case LocationPermission.whileInUse:
        return LocationPermissionStatus.allowed;
      case LocationPermission.always:
        return LocationPermissionStatus.allowed;
      case LocationPermission.unableToDetermine:
        return LocationPermissionStatus.denied;
    }
  }
}

// Plugin Methods
extension PrivateMethods on DefaultGeolocationService {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error(GeoLocationFailureMessages.locationServicesDisabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(GeoLocationFailureMessages.locationPermissionsDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(GeoLocationFailureMessages.locationPermissionsDeniedForever);
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}

