import 'package:bootcamp_starter/features/auth/UserRepository.dart';
import 'package:bootcamp_starter/features/auth/user_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../../network/api_response.dart';


class LoginProvider extends ChangeNotifier {
  late UserRepository userRepository;

  late ApiResponse<User> userApiResponse;

  ApiResponse<User> get user => userApiResponse;

  LoginProvider() {
    userRepository =UserRepository();
    loginUser();
  }

  loginUser() async {
    userApiResponse = ApiResponse.loading('login');
    notifyListeners();
    try {
      User user = await userRepository.login();
      userApiResponse = ApiResponse.completed(user);
      notifyListeners();
    } catch (e) {
      userApiResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
