class UserResponse {
  User? user;
  String? token;

  UserResponse({this.user, this.token});

  UserResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
}

  // UserResponse.fromJson(Map<String, dynamic> json) {
  //   //you can use your custom json field depend on api response
  //   // totalResults = json['total_results'];
  //   if (json['user'] != null) {
  //       results=User.fromJson(json['user']);
  //   }
  //
  //   if (json['token'] != null) {
  //     token=User.fromJson(json['token']) as String?;
  //   }
  //
  //
  //
  // }


class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  Null? country;
  Null? ip;
  double? long;
  double? lat;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.country,
        this.ip,
        this.long,
        this.lat});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['isActive'];
    country = json['country'];
    ip = json['ip'];
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['isActive'] = this.isActive;
    data['country'] = this.country;
    data['ip'] = this.ip;
    data['long'] = this.long;
    data['lat'] = this.lat;
    return data;
  }
}