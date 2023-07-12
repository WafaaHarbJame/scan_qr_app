import 'package:bootcamp_starter/features/auth/user_model.dart';
import 'package:bootcamp_starter/features/edit_link/EditLink.dart';
import 'package:bootcamp_starter/features/new_link/AddLink%20Response.dart';

import '../../../../network/api_base_helper.dart';
import 'ShPreferences.dart';

class UserRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String userToken = '1|LajBiiQSs1r9FOVowIXKpdFJYQAzCvrhCOjND7iM';
  String? token = ShPreferences.getToken();

  Future<dynamic> login(String url, String userName, String password) async {
    final response =
    await _helper.post(url, {}, {'email': userName, 'password': password});
    print("log $response");
    return UserResponse.fromJson(response);
  }

  Future<dynamic> editLink(String url, String title, String link,
      String username, int isActive) async {

    Map<String, String> body = {
      'title': title,
      'link': link,
      'username': username,
      'isActive': isActive.toString(),
    };

    final response = await _helper.put(
      url,
      body,
    );
    print("log $response");
    return EditLink.fromJson(response);
  }



  Future<dynamic> addLink(String url, String title, String link,
      String username, int isActive) async {

    Map<String, String> body = {
      'title': title,
      'link': link,
      'username': username,
      'isActive': isActive.toString(),
    };

    final response = await _helper.post(
      url,
      {
        'Authorization': 'Bearer $token'},
      body,
    );
    print("log $response");
    return AddLinkResponse.fromJson(response);
  }

}
