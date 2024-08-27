class CrediteCardModel {
  int? status;
  String? message;
  Data? data;

  CrediteCardModel({this.status, this.message, this.data});

  CrediteCardModel.fromJson(Map<String, dynamic> json) {
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
  String? accountHolderName;
  String? accountNumber;
  int? balance;
  String? bankAccountHolderName;
  int? id;

  Data(
      {this.accountHolderName,
        this.accountNumber,
        this.balance,
        this.bankAccountHolderName,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    balance = json['balance'];
    bankAccountHolderName = json['bank_account_holder_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_holder_name'] = this.accountHolderName;
    data['account_number'] = this.accountNumber;
    data['balance'] = this.balance;
    data['bank_account_holder_name'] = this.bankAccountHolderName;
    data['id'] = this.id;
    return data;
  }
}
