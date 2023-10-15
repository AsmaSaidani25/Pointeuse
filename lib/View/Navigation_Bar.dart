import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointeuse/View/Association.dart';
import 'package:pointeuse/View/Employees.dart';
import 'package:pointeuse/View/Settings.dart';
import 'Messages.dart';
import 'Planing.dart';
import 'Rapport.dart';
import 'Restaurant.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentTab = 0;
  final List<Widget> screens = [
    Employees(),
    Message(),
    Rapport(),
    Planing(),
    Restaurant(),
    Setting(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Planing();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade800,
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        //notchMargin: 20,
        //color: Colors.blue.shade800,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Planing();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_sharp,
                          color: currentTab == 0
                              ? Colors.blue.shade800
                              : Colors.grey,
                        ),
                        Text(
                          "Planing",
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Colors.blue.shade800
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Employees();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 1
                              ? Colors.blue.shade800
                              : Colors.grey,
                        ),
                        Text(
                          "Employees",
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Colors.blue.shade800
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Rapport();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu_book_sharp,
                          color: currentTab == 2
                              ? Colors.blue.shade800
                              : Colors.grey,
                        ),
                        Text(
                          "Rapport",
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Colors.blue.shade800
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Message();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_sharp,
                          color: currentTab == 3
                              ? Colors.blue.shade800
                              : Colors.grey,
                        ),
                        Text(
                          "Messages",
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Colors.blue.shade800
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Setting();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 4
                              ? Colors.blue.shade800
                              : Colors.grey,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              color: currentTab == 4
                                  ? Colors.blue.shade800
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Association();
                        currentTab = 5;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sync_alt,
                          color: currentTab == 5
                              ? Colors.blue.shade800
                              : Colors.grey,
                        ),
                        Text(
                          "Association",
                          style: TextStyle(
                              color: currentTab == 5
                                  ? Colors.blue.shade800
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
