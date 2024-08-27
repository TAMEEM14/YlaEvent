class ProfileDataModel {
  int? status;
  String? message;
  Data? data;

  ProfileDataModel({this.status, this.message, this.data});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? birthDay;
  String? city;
  String? photoPath;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.phoneNumber,
        this.email,
        this.birthDay,
        this.city,
        this.photoPath,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    birthDay = json['birth_day'];
    city = json['city'];
    photoPath = json['photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['birth_day'] = this.birthDay;
    data['city'] = this.city;
    data['photo_path'] = this.photoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
