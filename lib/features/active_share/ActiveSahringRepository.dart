
import 'package:bootcamp_starter/features/active_share/DeleteShareResponse.dart';
import 'package:bootcamp_starter/features/auth/user_model.dart';

import '../../../../network/api_base_helper.dart';
import '../auth/ShPreferences.dart';
import 'Active_sharing_model.dart';
import 'NearstSharingResponse.dart';

class ActiveSharingRep {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String? token = ShPreferences.getToken();


  Future<dynamic> activeShare(String url) async {
    final response = await _helper.post(url,{
      'Authorization': 'Bearer $token',
    },{'type' : "sender"});
    print("log activeShare response $response");
    return ActiveSharingResponse.fromJson(response);
  }


  Future<dynamic> removeShare(String url) async {
    final response = await _helper.delete(url,{
      'Authorization': 'Bearer $token',
    },{});
    print("log activeShare response $response");
    return DeleteShareResponse.fromJson(response);
  }


  Future<List<NearestUsers>?> fetchNearLinkList() async {
    final response = await _helper.get("/activeShare/nearest/1", {
      'Authorization': 'Bearer $token',
    });
    return NearstSharingResponse.fromJson(response).nearestUsers;
  }

}
