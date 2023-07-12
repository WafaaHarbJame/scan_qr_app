import 'package:bootcamp_starter/features/active_share/NearstSharingResponse.dart';
import 'package:flutter/cupertino.dart';
import '../../../../network/api_response.dart';
import '../../../new_link/AddLink Response.dart';
import '../models/link_model.dart';
import '../repo/LinkRepository.dart';

class LinkProvider extends ChangeNotifier {
  late LinkRepository _linkRepository;
  late ApiResponse<AddLinkResponse> _linkObject;

  late ApiResponse<List<Link>> _linkList;
  late ApiResponse<List<NearestUsers>> _linkNearList;

  ApiResponse<List<Link>> get linkList => _linkList;
  ApiResponse<List<NearestUsers>> get linkNearList => _linkNearList;
  ApiResponse<List<AddLink>> get bodyaddlink => bodyaddlink;

  LinkProvider() {
    _linkRepository = LinkRepository();
    fetchLinkList();
    fetchNearLinkList();
  }

  fetchLinkList() async {
    _linkList = ApiResponse.loading('Fetching Links');
    notifyListeners();
    try {
      List<Link> links = await _linkRepository.fetchLinkList();
      _linkList = ApiResponse.completed(links);
      notifyListeners();
    } catch (e) {
      _linkList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }


  fetchNearLinkList() async {
    _linkNearList = ApiResponse.loading('Fetching Links');
    notifyListeners();
    try {
      List<NearestUsers>? links = await _linkRepository.fetchNearLinkList();
      _linkNearList = ApiResponse.completed(links);
      notifyListeners();
    } catch (e) {
      _linkNearList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }






  addLink(String url, String title, String link,
      String username, int isActive) async {
    _linkObject = ApiResponse.loading('add link');
    notifyListeners();
    try {
      AddLinkResponse links = await _linkRepository.addLink(url, title, link, username, isActive);
      _linkObject = ApiResponse.completed(links);
      notifyListeners();
    } catch (e) {
      _linkObject = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }


}
