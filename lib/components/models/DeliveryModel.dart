import 'dart:convert';

List<DeliveryModel> invoicesModelFromJson(String str) =>
    List<DeliveryModel>.from(
        json.decode(str).map((x) => DeliveryModel.fromJson(x)));

String invoicesModelToJson(List<DeliveryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryModel {
  DeliveryModel({
    this.address,
    this.businessName,
    this.customerCode,
    this.status,
    this.statusDescription,
  });

  String address;
  String businessName;
  String customerCode;
  int status;
  String statusDescription;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
        address: json["Address"],
        businessName: json["BusinessName"],
        customerCode: json["CustomerCode"],
        status: json["Status"],
        statusDescription: json["StatusDescription"],
      );

  Map<String, dynamic> toJson() => {
        "Address": address,
        "BusinessName": businessName,
        "CustomerCode": customerCode,
        "Status": status,
        "StatusDescription": statusDescription,
      };
}
