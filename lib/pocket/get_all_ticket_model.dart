class GetAllTicketModel {
  int? status;
  String? message;
  List<Data>? data;

  GetAllTicketModel({this.status, this.message, this.data});

  GetAllTicketModel.fromJson(Map<String, dynamic> json) {
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
  int? eventInfoId;
  int? endUserId;
  String? reference;
  String? receiveAccount;
  String? type;
  String? status;
  int? hasFoodServices;
  String? bookedAt;
  int? totalPrice;
  String? createdAt;
  String? updatedAt;
  String? eventName;

  Data(
      {this.id,
        this.eventInfoId,
        this.endUserId,
        this.reference,
        this.receiveAccount,
        this.type,
        this.status,
        this.hasFoodServices,
        this.bookedAt,
        this.totalPrice,
        this.createdAt,
        this.updatedAt,
        this.eventName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventInfoId = json['event_info_id'];
    endUserId = json['end_user_id'];
    reference = json['reference'];
    receiveAccount = json['receive_account'];
    type = json['type'];
    status = json['status'];
    hasFoodServices = json['has_food_services'];
    bookedAt = json['booked_at'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    eventName = json['event_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_info_id'] = this.eventInfoId;
    data['end_user_id'] = this.endUserId;
    data['reference'] = this.reference;
    data['receive_account'] = this.receiveAccount;
    data['type'] = this.type;
    data['status'] = this.status;
    data['has_food_services'] = this.hasFoodServices;
    data['booked_at'] = this.bookedAt;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['event_name'] = this.eventName;
    return data;
  }
}
