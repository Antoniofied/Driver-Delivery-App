import 'package:beta_driver/screens/home/components/coustom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({
    Key key,
    this.currentIndex,
    this.inactiveColor,
    this.press,
  }) : super(key: key);
  @required
  final int currentIndex;
  @required
  final Color inactiveColor;
  @required
  Function press;

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: kPrimaryColor,
      selectedIndex: currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: press,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.assignment_outlined),
          title: Text('Active'),
          activeColor: Colors.orange,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.fact_check_outlined),
          title: Text(
            'Delivered',
          ),
          activeColor: Colors.green,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
          activeColor: Colors.white,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.phone_in_talk),
          title: Text('Incident'),
          activeColor: Colors.red,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );

    /*Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: SvgPicture.asset('assets/icons/flower.svg'),
              onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset('assets/icons/heart-icon.svg'),
              onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset('assets/icons/user-icon.svg'),
              onPressed: () {}),
        ],
      ),
    );*/
  }
}
