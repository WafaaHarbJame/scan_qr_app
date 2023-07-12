import '../profile/links/models/link_model.dart';

class AddLinkResponse {
  Link? link;

  AddLinkResponse({this.link});

  AddLinkResponse.fromJson(Map<String, dynamic> json) {
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    return data;
  }
}


