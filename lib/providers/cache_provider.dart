import 'package:shared_preferences/shared_preferences.dart';

class CacheProvider {
  static const String users = 'users';
  static const String albums = 'albums';
  static const String comments = 'comments';
  static const String posts = 'posts';
  static const String photos = 'photos';

  static void saveObjectJson({required String key, required String objectJson}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, objectJson);
  }

  static Future<String?> getObjectJson({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
