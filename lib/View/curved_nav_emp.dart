import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Messages.dart';
import 'PlaningEmployee.dart';

class navemp extends StatefulWidget {
  const navemp({Key? key}) : super(key: key);

  @override
  _navempState createState() => _navempState();
}

class _navempState extends State<navemp> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    PlaningEmploye(),
    Message(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.event_sharp, color: Colors.white, size: 35),
      Icon(Icons.message_outlined, color: Colors.white, size: 35),
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
                  backgroundColor: Colors.blue.shade50,
                  height: 50,
                  color: Colors.blue.shade700,
                  // animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 300),
                  index: index,
                  onTap: (index) => setState(() => this.index = index),
                )),
          ),
        ),
      ),
    );
  }
}
