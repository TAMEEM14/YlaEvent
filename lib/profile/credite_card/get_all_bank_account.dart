class GetAllBankAccountModel {
  int? status;
  String? message;
  List<Data>? data;

  GetAllBankAccountModel({this.status, this.message, this.data});

  GetAllBankAccountModel.fromJson(Map<String, dynamic> json) {
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
  int? endUserId;
  String? accountNumber;
  String? bankAccountHolderName;
  String? accountHolderName;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.endUserId,
        this.accountNumber,
        this.bankAccountHolderName,
        this.accountHolderName,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    endUserId = json['end_user_id'];
    accountNumber = json['account_number'];
    bankAccountHolderName = json['bank_account_holder_name'];
    accountHolderName = json['account_holder_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['end_user_id'] = this.endUserId;
    data['account_number'] = this.accountNumber;
    data['bank_account_holder_name'] = this.bankAccountHolderName;
    data['account_holder_name'] = this.accountHolderName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
