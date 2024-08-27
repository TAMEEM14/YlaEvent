class GetAllEventsModel {
  int? status;
  String? message;
  List<Data>? data;

  GetAllEventsModel({this.status, this.message, this.data});

  GetAllEventsModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Events>? events;

  Data(
      {this.id,
        this.name,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.events});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
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
  String? eventCategoryName;

  Events(
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
        this.agencyName,
        this.eventCategoryName});

  Events.fromJson(Map<String, dynamic> json) {
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
    eventCategoryName = json['event_category_name'];
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
    data['event_category_name'] = this.eventCategoryName;
    return data;
  }
}
