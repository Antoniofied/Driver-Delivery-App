import 'package:beta_driver/components/models/InvoiceModel.dart';
import 'package:beta_driver/screens/home/components/header_with_searchbox.dart';
import 'package:beta_driver/screens/home/components/title_with_custom_underline.dart';
import 'package:beta_driver/screens/invoices/components/invoice_card.dart';
import 'package:beta_driver/screens/scan/components/qrpage.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  final customerCode;
  Body({this.customerCode});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<InvoiceModel> allInvoices = [];
  List<InvoiceModel> thiCustomerInvoices = [];
  InvoiceModel inv1 = new InvoiceModel();
  InvoiceModel inv2 = new InvoiceModel();
  InvoiceModel inv3 = new InvoiceModel();
  InvoiceModel inv4 = new InvoiceModel();
  InvoiceModel inv5 = new InvoiceModel();
  InvoiceModel inv6 = new InvoiceModel();
  InvoiceModel inv7 = new InvoiceModel();

  void loadRequired() {
    inv1.invoiceNumber = '001-INV21-000001';
    inv1.invoiceDate = '2021/07/29';
    inv1.customerCode = 'AP0025359';
    inv1.invoiceAmount = 612200;
    allInvoices.add(inv1);

    inv2.invoiceNumber = '001-INV21-000002';
    inv2.invoiceDate = '2021/07/29';
    inv2.customerCode = 'AP0025359';
    inv2.invoiceAmount = 553200;
    allInvoices.add(inv2);

    inv3.invoiceNumber = '001-INV21-000003';
    inv3.invoiceDate = '2021/07/29';
    inv3.customerCode = 'IK0000155';
    inv3.invoiceAmount = 1213200;
    allInvoices.add(inv3);

    inv4.invoiceNumber = '001-INV21-000004';
    inv4.invoiceDate = '2021/07/29';
    inv4.customerCode = 'IK0002902';
    inv4.invoiceAmount = 513200;
    allInvoices.add(inv4);

    inv5.invoiceNumber = '001-INV21-000005';
    inv5.invoiceDate = '2021/07/29';
    inv5.customerCode = 'SBC-007';
    inv5.invoiceAmount = 1513200;
    allInvoices.add(inv5);

    inv6.invoiceNumber = '001-INV21-000006';
    inv6.invoiceDate = '2021/07/29';
    inv6.customerCode = 'AP0006139';
    inv6.invoiceAmount = 522200;
    allInvoices.add(inv6);

    inv7.invoiceNumber = '001-INV21-000007';
    inv7.invoiceDate = '2021/07/29';
    inv7.customerCode = 'IK0293049';
    inv7.invoiceAmount = 522200;
    allInvoices.add(inv7);

    thiCustomerInvoices = getInvoices(allInvoices, widget.customerCode);
  }

  List<InvoiceModel> getInvoices(
      List<InvoiceModel> allInvoices, String customerCode) {
    List<InvoiceModel> cutomerInvoices = [];
    for (InvoiceModel x in allInvoices
        .where((element) => element.customerCode == customerCode)) {
      cutomerInvoices.add(x);
    }
    return cutomerInvoices;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loadRequired();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Expanded(child: HeaderWithSearchBox()),
          TitleWithCustomUnderline(
            text: 'Invoices',
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: thiCustomerInvoices.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Invoice_Card(
                    invoiceNumber:
                        thiCustomerInvoices.elementAt(index).invoiceNumber,
                    amount: thiCustomerInvoices
                        .elementAt(index)
                        .invoiceAmount
                        .toString(),
                    deliver: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QrScreen(),
                          ));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
