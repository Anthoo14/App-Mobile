import 'package:geolocator/geolocator.dart';
import '../Entities/GeoServiceEntities.dart';

class GeolocationServiceMappers {
  static PositionEntity mapPosition(Position position) {
    /*
   
    Simulador
    I/flutter (14723): 37.421998333333335 - LAT
    I/flutter (14723): -122.084 - LNG

    Reales del centro de Barcelona para pruebas
    41.385599 - LAT
    2.169867 - LNG
    */
    return PositionEntity(longitude: position.longitude,
                          latitude: position.latitude,
                          timestamp: position.timestamp,
                          accuracy: position.accuracy,
                          altitude: position.altitude,
                          heading: position.heading,
                          speed: position.speed,
                          speedAccuracy: position.speedAccuracy);
  }
}