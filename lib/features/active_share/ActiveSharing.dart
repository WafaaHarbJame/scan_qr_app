import '../../network/api_response.dart';
import 'ActiveSahringRepository.dart';
import 'Active_sharing_model.dart';
import 'DeleteShareResponse.dart';

class ActiveSharingProvider1 {
  late ActiveSharingRep activeSharingRep  =ActiveSharingRep();

  Future<ApiResponse<ActiveSharingResponse>>  activeShare(int id) async {
    late ApiResponse<ActiveSharingResponse> userApiResponse;
    userApiResponse = ApiResponse.loading('activeShare');
    try {
      ActiveSharingResponse user = await activeSharingRep.activeShare("/activeShare/$id");
      userApiResponse = ApiResponse.completed(user);



    } catch (e) {
      userApiResponse = ApiResponse.error(e.toString());
    }
    return userApiResponse;
  }


  Future<ApiResponse<DeleteShareResponse>>  removeShare(int id) async {
    late ApiResponse<DeleteShareResponse> userApiResponse;
    userApiResponse = ApiResponse.loading('removeShare');
    try {
      DeleteShareResponse user = await activeSharingRep.removeShare("/activeShare/$id");
      userApiResponse = ApiResponse.completed(user);



    } catch (e) {
      userApiResponse = ApiResponse.error(e.toString());
    }
    return userApiResponse;
  }
}