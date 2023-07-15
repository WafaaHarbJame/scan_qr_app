import 'package:bootcamp_starter/features/active_share/ActiveSahringRepository.dart';
import 'package:bootcamp_starter/features/active_share/Active_sharing_model.dart';
import 'package:bootcamp_starter/features/auth/ShPreferences.dart';
import 'package:flutter/cupertino.dart';
import '../../../../network/api_response.dart';

class ActiveSharingProvider extends ChangeNotifier {
  late ActiveSharingRep activeSharingRep;

  late ApiResponse<ActiveSharing> apiResponse;

  ApiResponse<ActiveSharing> get activeShare => apiResponse;

  // ActiveSharingProvider() {
  //   apiResponse = ApiResponse.stop('not launch');
  //   activeSharingRep = ActiveSharingRep();
  // }
  //


  ActiveSharingProvider() {
    activeSharingRep = ActiveSharingRep();
    // activeSharing();
  }
  activeSharing(int id) async {
    apiResponse = ApiResponse.loading('activeShare');
    notifyListeners();
    try {
      ActiveSharingResponse user = await activeSharingRep.activeShare("/activeShare/$id");
      apiResponse = ApiResponse.completed(user.activeSharing);
      notifyListeners();
    } catch (e) {
      apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}



// class ActiveSharingProvider {
//   late ActiveSharingRep activeSharingRep  =ActiveSharingRep();
//
//   Future<ApiResponse<ActiveSharing>>  activeShare(String type) async {
//     late ApiResponse<ActiveSharing> userApiResponse;
//     userApiResponse = ApiResponse.loading('activeShare');
//     try {
//       ActiveSharingResponse user = await activeSharingRep.activeShare("/activeShare/2",type);
//       userApiResponse = ApiResponse.completed(user.activeSharing);
//
//
//
//     } catch (e) {
//       userApiResponse = ApiResponse.error(e.toString());
//     }
//     return userApiResponse;
//   }
// }
