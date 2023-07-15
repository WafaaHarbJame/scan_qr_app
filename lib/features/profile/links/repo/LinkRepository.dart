import '../../../../network/api_base_helper.dart';
import '../../../active_share/NearstSharingResponse.dart';
import '../../../auth/ShPreferences.dart';
import '../models/link_model.dart';

class LinkRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  // String userToken = '1|LajBiiQSs1r9FOVowIXKpdFJYQAzCvrhCOjND7iM';
  String? token = ShPreferences.getToken();

  Future<List<Link>> fetchLinkList() async {
    final response = await _helper.get("/links", {
      'Authorization': 'Bearer $token',
    });
    return LinkResponse.fromJson(response).results;
  }


  Future<List<NearestUsers>?> fetchNearLinkList(int id) async {
    final response = await _helper.get("/activeShare/nearest/$id", {
      'Authorization': 'Bearer $token',
    });
    return NearstSharingResponse.fromJson(response).nearestUsers;
  }

  Future<dynamic> addLink(String url, String title, String link,
      String username, int isActive) async {
    Map<String, String> body = {
      'title': title,
      'link': link,
      'username': username,
      'isActive': isActive.toString(),
    };
    String? token = ShPreferences.getToken();

    final response = await _helper.post(
        "",
        {
          'Authorization': 'Bearer $token',
        },
        body);
    return LinkResponse.fromJson(response).results;
  }
}
