import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Association.dart';
import 'Employees.dart';
import 'Planing.dart';
import 'Rapport.dart';
import 'Settings.dart';
import 'Widget/TabItem.dart';
import 'chat.dart';

class curved_nav_bar extends StatefulWidget {
  const curved_nav_bar({Key? key}) : super(key: key);

  @override
  _curved_nav_barState createState() => _curved_nav_barState();
}

class _curved_nav_barState extends State<curved_nav_bar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    Planing(),
    Employees(),
    chat(),
    Rapport(),
    Setting(),
    Association()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      TabItem(icon: Icons.event, text: "Planing"),
      TabItem(icon: Icons.person_outline, text: "Employees"),
      TabItem(icon: Icons.message_outlined, text: "Messages"),
      TabItem(icon: Icons.menu_book_outlined, text: "Rapport"),
      TabItem(icon: Icons.settings_applications_outlined, text: "Paramétres"),
      TabItem(icon: Icons.dashboard_outlined, text: "Dashboard"),
    ];
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            body: screens[index],
            bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                child: CurvedNavigationBar(
                  items: items,
                  key: navigationKey,
                  backgroundColor: Colors.white,
                  //buttonBackgroundColor: Colors.white,
                  height: 60,
                  color: Colors.blue.shade700,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 200),
                  index: index,
                  onTap: (index) => setState(() => this.index = index),
                )),
          ),
        ),
      ),
    );
  }
}
