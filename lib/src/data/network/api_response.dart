class ApiResponse {
  String? status = null;
  String? message= null;
  dynamic object= null;
  dynamic user= null;
  String? token= null;
  dynamic data= null;
  List<Banner>? banner = null;

  ApiResponse(
      {this.status,
      this.message,
      this.object,
      this.token,
      this.user,
      this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString();
    message = json['msg'];
    object = json['object'];
    token = json['token'];
    user = json['user'];
    data = json['data'];

    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['object'] = this.object;
    data['token'] = this.token;
    data['user'] = this.user;
    data['data'] = this.data;
    if (this.banner != null) {
      data['banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  String? id= null;
  String? banner= null;
  String? createdAt= null;
  Null updatedAt= null;

  Banner({this.id, this.banner, this.createdAt, this.updatedAt});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banner = json['banner'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banner'] = this.banner;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
