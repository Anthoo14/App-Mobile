import 'package:shared_preferences/shared_preferences.dart';

abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({ required String key, required String value });
  Future<void> saveRecentSearchInLocalStorage({ required String key, required List<String> value });
}

class DefaultSaveLocalStorageRepository extends SaveLocalStorageRepository {

  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> saveInLocalStorage({ required String key,
                                    required String value }) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  @override
  Future<void> saveRecentSearchInLocalStorage({ required String key, required List<String> value}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList(key, value);
  }
}