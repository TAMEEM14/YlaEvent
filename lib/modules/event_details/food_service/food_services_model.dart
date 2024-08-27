class FoodServicesModel {
  int? status;
  String? message;
  List<Data>? data;

  FoodServicesModel({this.status, this.message, this.data});

  FoodServicesModel.fromJson(Map<String, dynamic> json) {
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
  int? eventAgencyProfileId;
  int? foodCategoryServicesId;
  String? description;
  String? photoLink;
  String? status;
  int? useItBefore;
  int? addPrice;
  String? createdAt;
  String? updatedAt;
  List<Menus>? menus;

  Data(
      {this.id,
        this.name,
        this.eventAgencyProfileId,
        this.foodCategoryServicesId,
        this.description,
        this.photoLink,
        this.status,
        this.useItBefore,
        this.addPrice,
        this.createdAt,
        this.updatedAt,
        this.menus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    eventAgencyProfileId = json['event_agency_profile_id'];
    foodCategoryServicesId = json['food_category_services_id'];
    description = json['description'];
    photoLink = json['photo_link'];
    status = json['status'];
    useItBefore = json['use_it_before'];
    addPrice = json['add_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['event_agency_profile_id'] = this.eventAgencyProfileId;
    data['food_category_services_id'] = this.foodCategoryServicesId;
    data['description'] = this.description;
    data['photo_link'] = this.photoLink;
    data['status'] = this.status;
    data['use_it_before'] = this.useItBefore;
    data['add_price'] = this.addPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menus {
  int? id;
  int? foodServicesId;
  String? name;
  String? status;
  String? photoLink;
  int? useItBefore;
  String? createdAt;
  String? updatedAt;
  List<FoodMenuItems>? foodMenuItems;

  Menus(
      {this.id,
        this.foodServicesId,
        this.name,
        this.status,
        this.photoLink,
        this.useItBefore,
        this.createdAt,
        this.updatedAt,
        this.foodMenuItems});

  Menus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodServicesId = json['food_services_id'];
    name = json['name'];
    status = json['status'];
    photoLink = json['photo_link'];
    useItBefore = json['use_it_before'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['food_menu_items'] != null) {
      foodMenuItems = <FoodMenuItems>[];
      json['food_menu_items'].forEach((v) {
        foodMenuItems!.add(new FoodMenuItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['food_services_id'] = this.foodServicesId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['photo_link'] = this.photoLink;
    data['use_it_before'] = this.useItBefore;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.foodMenuItems != null) {
      data['food_menu_items'] =
          this.foodMenuItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodMenuItems {
  int? id;
  String? name;
  String? description;
  int? price;
  int? quantity;
  String? photoLink;
  int? foodMenuServicesId;
  String? createdAt;
  String? updatedAt;

  FoodMenuItems(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.quantity,
        this.photoLink,
        this.foodMenuServicesId,
        this.createdAt,
        this.updatedAt});

  FoodMenuItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    photoLink = json['photo_link'];
    foodMenuServicesId = json['food_menu_services_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['photo_link'] = this.photoLink;
    data['food_menu_services_id'] = this.foodMenuServicesId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
