import '../../network/api_response.dart';
import 'ActiveSahringRepository.dart';
import 'Active_sharing_model.dart';

class ActiveSharingProvider1 {
  late ActiveSharingRep activeSharingRep  =ActiveSharingRep();

  Future<ApiResponse<ActiveSharingResponse>>  activeShare(String type) async {
    late ApiResponse<ActiveSharingResponse> userApiResponse;
    userApiResponse = ApiResponse.loading('activeShare');
    try {
      ActiveSharingResponse user = await activeSharingRep.activeShare("/activeShare/2",type);
      userApiResponse = ApiResponse.completed(user);



    } catch (e) {
      userApiResponse = ApiResponse.error(e.toString());
    }
    return userApiResponse;
  }
}