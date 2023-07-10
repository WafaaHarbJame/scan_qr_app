
import 'package:bootcamp_starter/features/auth/user_model.dart';

import '../../../../network/api_base_helper.dart';

class UserRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String userToken = '1|LajBiiQSs1r9FOVowIXKpdFJYQAzCvrhCOjND7iM';


  Future<dynamic> login() async {
    final response = await _helper.post("", {'email' : 'a@gmail.com','password' : '123456'}, {});
    return UserResponse.fromJson(response).results;
  }
}
