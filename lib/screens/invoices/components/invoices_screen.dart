import 'package:beta_driver/constants.dart';
import 'package:beta_driver/screens/invoices/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InvoicesScreen extends StatelessWidget {
  final cCode;
  InvoicesScreen({this.cCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(customerCode: cCode),
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
