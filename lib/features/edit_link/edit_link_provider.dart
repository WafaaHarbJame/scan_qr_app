import 'package:bootcamp_starter/features/auth/UserRepository.dart';
import 'package:bootcamp_starter/features/new_link/AddLink%20Response.dart';
import '../../../../network/api_response.dart';
import 'EditLink.dart';


class EditLinkProvider {
  late UserRepository userRepository  =UserRepository();


  Future<ApiResponse<EditLink>>  editLink(int id,String title,String link,String username,int isActive) async {
    late ApiResponse<EditLink> userApiResponse;
    userApiResponse = ApiResponse.loading('edit link');
    try {

      EditLink user = await userRepository.editLink("/links/$id",title,link,username,isActive);
      userApiResponse = ApiResponse.completed(user);



    } catch (e) {
      userApiResponse = ApiResponse.error(e.toString());
    }
    return userApiResponse;
  }


  Future<ApiResponse<AddLinkResponse>>  addLink(String title,String link,String username,int isActive) async {
    late ApiResponse<AddLinkResponse> userApiResponse;
    userApiResponse = ApiResponse.loading('add link');
    try {

      AddLinkResponse user = await userRepository.addLink("/links",title,link,username,isActive);
      userApiResponse = ApiResponse.completed(user);



    } catch (e) {
      userApiResponse = ApiResponse.error(e.toString());
    }
    return userApiResponse;
  }

}

