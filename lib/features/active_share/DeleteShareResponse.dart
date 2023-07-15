

class DeleteShareResponse {
  bool? isDeleted;

  DeleteShareResponse({this.isDeleted});

  DeleteShareResponse.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}