import 'package:bootcamp_starter/features/auth/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShPreferences {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get preferences {
    if (_preferences != null) {
      return _preferences!;
    }
    throw Exception('UserPreferences has not been initialized.');
  }

  static void saveUser(User? user) {
    final preferences = ShPreferences.preferences;
    preferences?.setInt('id', user?.id?? 0);
    preferences?.setString('name', user?.name?? "");
    preferences?.setString('email', user?.email?? "");
    // ... Save other user properties
  }

  static User? getUser() {
    final preferences = ShPreferences.preferences;
    final int? id = preferences?.getInt('id');
    final String? name = preferences?.getString('name');
    final String? email = preferences?.getString('email');
    // ... Retrieve other user properties

    if (id != null && name != null && email != null) {
      return User(id: id, name: name, email: email);
    }
    return null;
  }

  static void saveToken(String? token) {
    final preferences = ShPreferences.preferences;
    preferences?.setString('token', token!);
  }

  static String? getToken() {
    final preferences = ShPreferences.preferences;
    return preferences?.getString('token');
  }
}