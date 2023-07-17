import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceConfig {
  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();
}
