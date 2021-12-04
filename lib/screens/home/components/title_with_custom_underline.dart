import 'package:flutter/material.dart';
import 'package:beta_driver/constants.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      height: 24,
      child: Stack(
        children: [
          Padding(
            //padding: EdgeInsets.only(left: kDefaultPadding / 4),
            padding: EdgeInsets.only(
              left: 4,
              right: 4,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              //margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 5,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
