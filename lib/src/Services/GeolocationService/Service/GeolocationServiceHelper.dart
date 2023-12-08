import 'package:geolocator/geolocator.dart';
import 'package:flutter_vscode/src/Services/GeolocationService/Interfaces/GeolocationServiceInterface.dart';

class DefaultGeolocationServiceHelper extends GeolocationServiceHelper{
  @override
  double getDistanceBetweenInKilometters(double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude) {
    double distanceInKilometters = Geolocator.distanceBetween(startLatitude, startLongitude, destinationLatitude, destinationLongitude) / 1000;
    //  Printable.printMessageOnConsole("$distanceInKilometters - ", "Distance in Kilometters");
    return distanceInKilometters;
  }

  @override
  double getDistanceBetweenInMetters(double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude) {
    double distanceInMeters = Geolocator.distanceBetween(startLatitude, startLongitude, destinationLatitude, destinationLongitude);
    // Printable.printMessageOnConsole("$distanceInMeters - ", "Distance in Metters");
    return distanceInMeters;
  }
  
}