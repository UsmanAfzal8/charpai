import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static late SharedPreferences? _preferences;
  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static void signout() => _preferences!.clear();

  static const String _favKey = 'FAVKEY';

  //
  // Setters
  //
  static Future<void> setFavroites(List<String> uid) async =>
      _preferences!.setStringList(_favKey, uid);

  //
  // Getters
  //
  static List<String> get getFavroites =>
      _preferences!.getStringList(_favKey) ?? <String>[];
}
