import 'dart:convert';

List<InvoiceDetails> invoiceDetailsFromJson(String str) =>
    List<InvoiceDetails>.from(
        json.decode(str).map((x) => InvoiceDetails.fromJson(x)));

String invoiceDetailsToJson(List<InvoiceDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceDetails {
  InvoiceDetails({
    this.invoiceNumber,
    this.itemDescription,
    this.itemQuantity,
    this.invoiceAmount,
  });

  String invoiceNumber;
  String itemDescription;
  int itemQuantity;
  int invoiceAmount;

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) => InvoiceDetails(
        invoiceNumber: json["InvoiceNumber"],
        itemDescription: json["ItemDescription"],
        itemQuantity: json["ItemQuantity"],
        invoiceAmount: json["InvoiceAmount"],
      );

  Map<String, dynamic> toJson() => {
        "InvoiceNumber": invoiceNumber,
        "ItemDescription": itemDescription,
        "ItemQuantity": itemQuantity,
        "InvoiceAmount": invoiceAmount,
      };
}
