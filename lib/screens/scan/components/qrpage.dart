import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../constants.dart';

class QrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: kDefaultPadding,
                top: kDefaultPadding / 2,
              ),
              child: Text(
                'Scan QR Code',
                style: Theme.of(context).textTheme.button,
              ),
            ),
            Center(
              child: Container(
                height: 200,
                child: SfBarcodeGenerator(
                  value: 'Antoniofied',
                  symbology: QRCode(),
                  //showValue: true,
                  barColor: kPrimaryColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: kDefaultPadding,
                top: kDefaultPadding,
              ),
              child: Text(
                'OR',
                style: Theme.of(context).textTheme.button,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Use Delivery PIN',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
      title: Text(
        'Beta Driver',
        style: TextStyle(
          color: kBackgroundColor,
        ),
      ),
    );
  }
}
