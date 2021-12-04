import 'dart:convert';

List<InvoiceModel> invoiceDetailsFromJson(String str) =>
    List<InvoiceModel>.from(
        json.decode(str).map((x) => InvoiceModel.fromJson(x)));

String invoiceDetailsToJson(List<InvoiceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceModel {
  InvoiceModel({
    this.invoiceNumber,
    this.invoiceAmount,
    this.customerCode,
    this.invoiceDate,
  });

  String invoiceNumber;
  int invoiceAmount;
  String customerCode;
  String invoiceDate;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        invoiceNumber: json["InvoiceNumber"],
        invoiceAmount: json["InvoiceAmount"],
        customerCode: json["CustomerCode"],
        invoiceDate: json["InvoiceDate"],
      );

  Map<String, dynamic> toJson() => {
        "InvoiceNumber": invoiceNumber,
        "InvoiceAmount": invoiceAmount,
        "CustomerCode": customerCode,
        "InvoiceDate": invoiceDate,
      };
}
