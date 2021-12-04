import 'package:beta_driver/constants.dart';
import 'package:beta_driver/screens/details/components/image_and_icons.dart';
import 'package:beta_driver/screens/details/components/title_and_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icon_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndIcons(size: size),
            TitleAndPrice(
              title: 'Agelica',
              country: 'Nigeria',
              price: 450,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width / 2,
                  height: 84,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                    color: kPrimaryColor,
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Description'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
