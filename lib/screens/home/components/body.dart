import 'package:beta_driver/components/models/DeliveryModel.dart';
import 'package:beta_driver/constants.dart';
import 'package:beta_driver/screens/details/components/details_screen.dart';
import 'package:beta_driver/screens/home/components/recomend_plants.dart';
import 'package:beta_driver/screens/home/components/title_with_custom_underline.dart';
import 'package:beta_driver/screens/invoices/components/invoices_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'featured_plants.dart';
import 'header_with_searchbox.dart';
import 'delivery_card.dart';

class Body extends StatefulWidget {
  final currentIndex;
  Body({this.currentIndex});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<DeliveryModel> allDeliveries = [];
  List<DeliveryModel> delivesInTransit = [];
  List<DeliveryModel> delivered = [];
  DeliveryModel delivery1 = new DeliveryModel();
  DeliveryModel delivery2 = new DeliveryModel();
  DeliveryModel delivery3 = new DeliveryModel();
  DeliveryModel delivery4 = new DeliveryModel();
  DeliveryModel delivery5 = new DeliveryModel();
  DeliveryModel delivery6 = new DeliveryModel();

  void loadRequired() {
    delivery1.businessName = 'G Jonny Enterprise';
    delivery1.address = 'No. 2 Address 1, Lagos';
    delivery1.customerCode = 'AP0025359';
    delivery1.status = 1;
    delivery1.statusDescription = 'In Transit';
    allDeliveries.add(delivery1);

    delivery3.businessName = 'Niktuns Ventures';
    delivery3.address = 'No. 2 Address 5, Lagos';
    delivery3.customerCode = 'IK0000155';
    delivery3.status = 1;
    delivery3.statusDescription = 'In Transit';
    allDeliveries.add(delivery3);

    delivery4.businessName = 'K Mart Stores';
    delivery4.address = 'No. 21 Address 9, Lagos';
    delivery4.customerCode = 'IK0002902';
    delivery4.status = 1;
    delivery4.statusDescription = 'In Transit';
    allDeliveries.add(delivery4);

    delivery6.businessName = 'Antonio Xquisites Stores';
    delivery6.address = 'No. 45B Address 1, Lagos';
    delivery6.customerCode = 'SBC-007';
    delivery6.status = 1;
    delivery6.statusDescription = 'In Transit';
    allDeliveries.add(delivery6);

    delivery2.businessName = 'Topview Ventures';
    delivery2.address = 'No. 22 Address 2, Lagos';
    delivery2.customerCode = 'AP0006139';
    delivery2.status = 2;
    delivery2.statusDescription = 'Delivered';
    allDeliveries.add(delivery2);

    delivery5.businessName = 'Best Globals';
    delivery5.address = 'No. 848 Address 9, Lagos';
    delivery5.customerCode = 'IK0293049';
    delivery5.status = 2;
    delivery5.statusDescription = 'Delivered';
    allDeliveries.add(delivery5);

    delivesInTransit = getDeliveries(allDeliveries);
    delivered = getDeliveredList(allDeliveries);
  }

  List<DeliveryModel> getDeliveries(List<DeliveryModel> allDeliveries) {
    List<DeliveryModel> outGoingDeliveries = [];
    for (DeliveryModel x
        in allDeliveries.where((element) => element.status == 1)) {
      outGoingDeliveries.add(x);
    }
    return outGoingDeliveries;
  }

  List<DeliveryModel> getDeliveredList(List<DeliveryModel> allDeliveries) {
    List<DeliveryModel> deliveredList = [];
    for (DeliveryModel x
        in allDeliveries.where((element) => element.status == 2)) {
      deliveredList.add(x);
    }
    return deliveredList;
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
    //it will provide total width and height of device screen
    Size size = MediaQuery.of(context).size;
    List<Widget> pages = [
      Deliveries(
        listOfInvoices: delivesInTransit,
        title: 'Active Deliveries',
      ),
      Deliveries(
        listOfInvoices: delivered,
        title: 'Delivered',
      ),
      Deliveries(
        listOfInvoices: delivesInTransit,
        title: 'Active Deliveries',
      ),
      Deliveries(
        listOfInvoices: delivesInTransit,
        title: 'Active Deliveries',
      ),
    ];
    return IndexedStack(
      index: widget.currentIndex,
      children: pages,
    );
  }
}

class Deliveries extends StatelessWidget {
  const Deliveries({
    Key key,
    @required this.listOfInvoices,
    this.title,
  }) : super(key: key);

  final List<DeliveryModel> listOfInvoices;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: HeaderWithSearchBox()),
        TitleWithCustomUnderline(
          text: title,
        ),

        //Custom recomend plant (Tutorial)
        /*RecomendsPlants(),*/

        //Custom invoice card
        /*Invoices_card(
          invoiceNumber: '001-inv21-2203327',
          businessName: 'G Jonny Enterprise',
          press: () {
            print('Invoice');
          },
        ),*/
        Expanded(
          flex: 3,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listOfInvoices.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Delivery_Card(
                  businessName: listOfInvoices.elementAt(index).businessName,
                  address: listOfInvoices.elementAt(index).address,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvoicesScreen(
                            cCode: listOfInvoices.elementAt(index).customerCode,
                          ),
                        ));
                  },
                ),
              );
            },
          ),
        ),

        //Custom featured plant (Tutorial)
        /*TitleWithCustomUnderline(
          text: 'Featuring',
        ),*/

        //Custom featured plant (Tutorial)
        /*FeaturedPlants(),*/
        SizedBox(
          height: kDefaultPadding,
        ),
      ],
    );
  }
}
