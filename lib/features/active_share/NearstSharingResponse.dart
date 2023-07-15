import '../auth/user_model.dart';

  class NearstSharingResponse {
  int? count;
  List<NearestUsers>? nearestUsers;

  NearstSharingResponse({this.count, this.nearestUsers});

  NearstSharingResponse.fromJson(Map<String, dynamic> json) {
  count = json['count'];
  if (json['nearest-users'] != null) {
  nearestUsers = <NearestUsers>[];
  json['nearest-users'].forEach((v) {
  nearestUsers!.add(new NearestUsers.fromJson(v));
  });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['count'] = this.count;
  if (this.nearestUsers != null) {
  data['nearest-users'] =
  this.nearestUsers!.map((v) => v.toJson()).toList();
  }
  return data;
  }
  }

  class NearestUsers {
  int? id;
  int? userId;
  String? type;
  String? createdAt;
  String? updatedAt;
  double? distance;
  User? user;

  NearestUsers(
  {this.id,
  this.userId,
  this.type,
  this.createdAt,
  this.updatedAt,
  this.distance,
  this.user});

  NearestUsers.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  userId = json['user_id'];
  type = json['type'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  distance =  json['distance']?.toDouble();
  user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['user_id'] = this.userId;
  data['type'] = this.type;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  data['distance'] = this.distance;
  if (this.user != null) {
  data['user'] = this.user!.toJson();
  }
  return data;
  }
  }

