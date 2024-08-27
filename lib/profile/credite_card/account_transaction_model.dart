class AccountTransactionModel {
  int? status;
  String? message;
  List<Data>? data;

  AccountTransactionModel({this.status, this.message, this.data});

  AccountTransactionModel.fromJson(Map<String, dynamic> json) {
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
  int? accountId;
  int? amount;
  int? id;
  String? receiverAccount;
  String? transactionDate;
  String? transactionType;

  Data(
      {this.accountId,
        this.amount,
        this.id,
        this.receiverAccount,
        this.transactionDate,
        this.transactionType});

  Data.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    amount = json['amount'];
    id = json['id'];
    receiverAccount = json['receiver_account'];
    transactionDate = json['transaction_date'];
    transactionType = json['transaction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['amount'] = this.amount;
    data['id'] = this.id;
    data['receiver_account'] = this.receiverAccount;
    data['transaction_date'] = this.transactionDate;
    data['transaction_type'] = this.transactionType;
    return data;
  }
}
