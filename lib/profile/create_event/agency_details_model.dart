class AgencyDetailsModel {
  int? status;
  String? message;
  List<Data>? data;

  AgencyDetailsModel({this.status, this.message, this.data});

  AgencyDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? companyName;
  String? location;
  String? contactEmail;
  String? contactNumber;
  String? buildingLocation;
  String? landLine;
  String? typeOfBusiness;
  String? logo;
  int? numberOfEvent;
  int? numberOfServices;
  int? numberOfSponsor;
  int? numberOfMember;
  int? numberOfMusicalBand;

  Data(
      {this.id,
        this.companyName,
        this.location,
        this.contactEmail,
        this.contactNumber,
        this.buildingLocation,
        this.landLine,
        this.typeOfBusiness,
        this.logo,
        this.numberOfEvent,
        this.numberOfServices,
        this.numberOfSponsor,
        this.numberOfMember,
        this.numberOfMusicalBand});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    location = json['location'];
    contactEmail = json['contact_email'];
    contactNumber = json['contact_number'];
    buildingLocation = json['building_location'];
    landLine = json['land_line'];
    typeOfBusiness = json['type_of_business'];
    logo = json['logo'];
    numberOfEvent = json['number_of_event'];
    numberOfServices = json['number_of_services'];
    numberOfSponsor = json['number_of_sponsor'];
    numberOfMember = json['number_of_member'];
    numberOfMusicalBand = json['number_of_musical_band'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['location'] = this.location;
    data['contact_email'] = this.contactEmail;
    data['contact_number'] = this.contactNumber;
    data['building_location'] = this.buildingLocation;
    data['land_line'] = this.landLine;
    data['type_of_business'] = this.typeOfBusiness;
    data['logo'] = this.logo;
    data['number_of_event'] = this.numberOfEvent;
    data['number_of_services'] = this.numberOfServices;
    data['number_of_sponsor'] = this.numberOfSponsor;
    data['number_of_member'] = this.numberOfMember;
    data['number_of_musical_band'] = this.numberOfMusicalBand;
    return data;
  }
}
