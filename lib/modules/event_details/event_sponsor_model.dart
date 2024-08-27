class EventSponsorModel {
  int? status;
  String? message;
  List<Data>? data;

  EventSponsorModel({this.status, this.message, this.data});

  EventSponsorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? jobTitle;
  String? email;
  int? eventAgencyProfileId;
  String? contractPdfPath;
  String? phoneNumber;
  String? bio;
  String? photoLink;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.jobTitle,
        this.email,
        this.eventAgencyProfileId,
        this.contractPdfPath,
        this.phoneNumber,
        this.bio,
        this.photoLink,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    jobTitle = json['job_title'];
    email = json['email'];
    eventAgencyProfileId = json['event_agency_profile_id'];
    contractPdfPath = json['contract_pdf_path'];
    phoneNumber = json['phone_number'];
    bio = json['bio'];
    photoLink = json['photo_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['job_title'] = this.jobTitle;
    data['email'] = this.email;
    data['event_agency_profile_id'] = this.eventAgencyProfileId;
    data['contract_pdf_path'] = this.contractPdfPath;
    data['phone_number'] = this.phoneNumber;
    data['bio'] = this.bio;
    data['photo_link'] = this.photoLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
