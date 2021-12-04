import 'package:flutter/material.dart';

import '../../../constants.dart';

class Delivery_Card extends StatelessWidget {
  const Delivery_Card({
    Key key,
    this.address,
    this.businessName,
    this.press,
  }) : super(key: key);

  final String address, businessName;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(
            //left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2,
          ),
          //width: size.width,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding - 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: kPrimaryColor.withOpacity(0.23),
                    )
                  ],
                ),
                child: Icon(
                  Icons.assignment,
                  color: kPrimaryColor,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        color: kPrimaryColor.withOpacity(0.23),
                      )
                    ],
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${businessName}\n'.toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: address,
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
