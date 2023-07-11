import 'package:bootcamp_starter/features/auth/UserPreferences.dart';
import 'package:bootcamp_starter/features/auth/UserRepository.dart';
import 'package:bootcamp_starter/features/auth/user_model.dart';
import '../../../../network/api_response.dart';


// class LoginProvider extends ChangeNotifier {
//   late UserRepository userRepository;
//
//   late ApiResponse<User> userApiResponse;
//
//   ApiResponse<User> get user => userApiResponse;
//
//   LoginProvider() {
//     userApiResponse = ApiResponse.stop('not launch');
//     userRepository =UserRepository();
//   }
//
//   loginUser() async {
//     userApiResponse = ApiResponse.loading('login');
//     notifyListeners();
//     try {
//       User user = await userRepository.login("/login");
//       userApiResponse = ApiResponse.completed(user);
//       UserPreferences.saveUser(user);
//
//       notifyListeners();
//     } catch (e) {
//       userApiResponse = ApiResponse.error(e.toString());
//       notifyListeners();
//     }
//   }
// }

class LoginProvider {
  late UserRepository userRepository  =UserRepository();

  Future<ApiResponse<User>>  loginUser(String userName,String password) async {
    late ApiResponse<User> userApiResponse;
    userApiResponse = ApiResponse.loading('login');
    try {
      UserResponse user = await userRepository.login("/login",userName,password);
      userApiResponse = ApiResponse.completed(user.user,);
      ShPreferences.saveUser(user.user);
      ShPreferences.saveToken(user.token);


    } catch (e) {
      userApiResponse = ApiResponse.error(e.toString());
    }
    return userApiResponse;
  }
}

