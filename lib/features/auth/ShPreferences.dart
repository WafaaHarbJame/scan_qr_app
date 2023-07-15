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

  // static void saveUser(User? user) {
  //   final preferences = ShPreferences.preferences;
  //   preferences?.setInt('id', user?.id ?? 0);
  //   preferences?.setString('name', user?.name ?? "");
  //   preferences?.setString('email', user?.email ?? "");
  //   // ... Save other user properties
  // }

  static void saveUser(User? user) {
    final preferences = ShPreferences.preferences;

    if (user == null) {
      preferences?.remove('id');
      preferences?.remove('name');
      preferences?.remove('email');
    } else {
      preferences?.setInt('id', user.id ?? 0);
      preferences?.setString('name', user.name ?? "");
      preferences?.setString('email', user.email ?? "");
      preferences?.setInt('isActive', user.isActive ?? 0);
      preferences?.setDouble('long', user.long ?? 0.0);
      preferences?.setDouble('lat', user.lat ?? 0.0);

      // ... Save other user properties
    }
  }



  static User? getUser() {
    final preferences = ShPreferences.preferences;
    final int? id = preferences?.getInt('id');
    final String? name = preferences?.getString('name');
    final String? email = preferences?.getString('email');
    final int? isActive = preferences?.getInt('isActive');
    final double? long = preferences?.getDouble('long');
    final double? lat = preferences?.getDouble('lat');

    if (id != null && name != null && email != null) {
      return User(id: id, name: name, email: email);
    }
    return null;
  }

  // static void saveToken(String? token) {
  //   final preferences = ShPreferences.preferences;
  //   preferences?.setString('token', token ?? "");
  // }

  static void saveToken(String? token) {
    final preferences = ShPreferences.preferences;
    preferences?.setString('token', token ?? "");
  }

  static String? getToken() {
    final preferences = ShPreferences.preferences;
    return preferences?.getString('token');
  }
}