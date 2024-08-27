class EventDataByIdModel {
  int? status;
  String? message;
  Data? data;

  EventDataByIdModel({this.status, this.message, this.data});

  EventDataByIdModel.fromJson(Map<String, dynamic> json) {
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
  int? eventCategoryId;
  String? type;
  int? eventAgencyProfileId;
  String? eventDate;
  String? publishItAt;
  String? eventTime;
  String? description;
  String? status;
  int? availableTicket;
  int? price;
  String? location;
  String? receiveAccount;
  String? photoLink;
  String? createdAt;
  String? updatedAt;
  int? hallServicesId;
  String? agencyName;

  Data(
      {this.id,
        this.name,
        this.eventCategoryId,
        this.type,
        this.eventAgencyProfileId,
        this.eventDate,
        this.publishItAt,
        this.eventTime,
        this.description,
        this.status,
        this.availableTicket,
        this.price,
        this.location,
        this.receiveAccount,
        this.photoLink,
        this.createdAt,
        this.updatedAt,
        this.hallServicesId,
        this.agencyName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    eventCategoryId = json['event_category_id'];
    type = json['type'];
    eventAgencyProfileId = json['event_agency_profile_id'];
    eventDate = json['event_date'];
    publishItAt = json['publish_it_at'];
    eventTime = json['event_time'];
    description = json['description'];
    status = json['status'];
    availableTicket = json['available_ticket'];
    price = json['price'];
    location = json['location'];
    receiveAccount = json['receive_account'];
    photoLink = json['photo_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hallServicesId = json['hall_services_id'];
    agencyName = json['agency_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['event_category_id'] = this.eventCategoryId;
    data['type'] = this.type;
    data['event_agency_profile_id'] = this.eventAgencyProfileId;
    data['event_date'] = this.eventDate;
    data['publish_it_at'] = this.publishItAt;
    data['event_time'] = this.eventTime;
    data['description'] = this.description;
    data['status'] = this.status;
    data['available_ticket'] = this.availableTicket;
    data['price'] = this.price;
    data['location'] = this.location;
    data['receive_account'] = this.receiveAccount;
    data['photo_link'] = this.photoLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['hall_services_id'] = this.hallServicesId;
    data['agency_name'] = this.agencyName;
    return data;
  }
}
