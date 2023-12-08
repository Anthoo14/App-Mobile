import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Managers/Places/Decodables/PlaceList/PlaceListDecodable.dart';
import 'package:delivery/src/Managers/Places/Interfaces/Interfaces.dart';
import 'package:delivery/src/Managers/Places/PlacesManager.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Given
  PlacesManager sut = DefaultPlacesManager();

  test('Test correct response of novelty places', () async {
    final placeList = await sut.fetchPlaceList();
    expect(placeList, isA<PlaceListDecodable>());
  });
}