import 'package:shared_preferences/shared_preferences.dart';

Future<String?> readToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("accessToken");
}

Future<void> saveToSharedPreferences(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("accessToken", token);
}

Future<void> clearToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("accessToken");
}
