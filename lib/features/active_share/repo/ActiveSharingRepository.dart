import '../../../../network/api_base_helper.dart';
import '../models/activesharing_model.dart';

class ActiveSharingRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String userToken = '1|LajBiiQSs1r9FOVowIXKpdFJYQAzCvrhCOjND7iM';

  Future<List<ActiveSharing>> fetchLinkList() async {
    final response = await _helper.get("/activeShare/nearest/1", {
      'Authorization': 'Bearer $userToken',
    });
    return ActiveSharingResponse.fromJson(response).results;
  }
}
