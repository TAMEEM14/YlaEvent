class MusicalBandModel {
  int? status;
  String? message;
  List<Data>? data;

  MusicalBandModel({this.status, this.message, this.data});

  MusicalBandModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }


}

class Data {
  int? id;
  String? name;
  int? eventAgencyProfileId;
  String? description;
  String? typeOfMusic;
  int? numberOfMembers;
  String? status;
  String? photoLink;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.eventAgencyProfileId,
        this.description,
        this.typeOfMusic,
        this.numberOfMembers,
        this.status,
        this.photoLink,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    eventAgencyProfileId = json['event_agency_profile_id'];
    description = json['description'];
    typeOfMusic = json['type_of_music'];
    numberOfMembers = json['number_of_members'];
    status = json['status'];
    photoLink = json['photo_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['event_agency_profile_id'] = this.eventAgencyProfileId;
    data['description'] = this.description;
    data['type_of_music'] = this.typeOfMusic;
    data['number_of_members'] = this.numberOfMembers;
    data['status'] = this.status;
    data['photo_link'] = this.photoLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
