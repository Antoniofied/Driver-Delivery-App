import 'package:beta_driver/constants.dart';
import 'package:beta_driver/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'my_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        currentIndex: _currentIndex,
      ),
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: _currentIndex,
        inactiveColor: _inactiveColor,
        press: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
