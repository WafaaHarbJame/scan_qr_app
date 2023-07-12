import 'package:flutter/cupertino.dart';
import '../../../../network/api_response.dart';
import '../../../new_link/AddLink Response.dart';
import '../models/link_model.dart';
import '../repo/LinkRepository.dart';

class LinkProvider extends ChangeNotifier {
  late LinkRepository _linkRepository;

  late ApiResponse<List<Link>> _linkList;
  late ApiResponse<AddLinkResponse> _linkObject;

  ApiResponse<List<Link>> get linkList => _linkList;
  ApiResponse<List<AddLink>> get bodyaddlink => bodyaddlink;

  LinkProvider() {
    _linkRepository = LinkRepository();
    fetchLinkList();
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
