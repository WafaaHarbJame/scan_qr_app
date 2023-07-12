
import 'package:bootcamp_starter/features/auth/user_model.dart';

import '../../../../network/api_base_helper.dart';
import '../auth/ShPreferences.dart';
import 'Active_sharing_model.dart';

class ActiveSharingRep {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String? token = ShPreferences.getToken();


  Future<dynamic> activeShare(String url,String type) async {
    final response = await _helper.post(url,{
      'Authorization': 'Bearer $token',
    },{'type' : type});
    print("log activeShare response $response");
    return ActiveSharingResponse.fromJson(response);
  }
}
