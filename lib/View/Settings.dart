import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pointeuse/Controller/FadeAnimation.dart';
import 'LoginForm.dart';
import 'Restaurant.dart';
import 'Widget/DrawerItem.dart';
import 'home_view.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  double screenWidth = 0;
  double screenHeight = 0;
  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = false;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('d.MM.yyyy');
    final String formattedDate = formatter.format(now);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
            child: Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/logo-solutions2-1.png',
                    width: 250,
                    height: 250,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  name: 'Restaurant',
                  icon: Icons.people,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Restaurant()),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Badging',
                    icon: Icons.account_box_rounded,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Connexion',
                    icon: Icons.message_outlined,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginForm()),
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text('  $formattedDate'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sync,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                FadeAnimation(
                    1.2,
                    Text(
                      "PARAMETRES",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 20),
                    )),
                SizedBox(
                  width: 185,
                ),
                FadeAnimation(
                  1.4,
                  SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF509DCD)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Enregistrer',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: Text(
                                'EMPLOYEE',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('PRET SALARIE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              children: <Widget>[
                                ListTile(
                                    title: Text(
                                        'Active la fonctionnalité de pret des salariés.')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'POINTEUSE',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('AFFICHAGE DATE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(
                                    title: Text(
                                        '1-> Date calendaire 2-> Date journée d activité 3-> Combinaison des dates')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'POINTEUSE',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('CLAVIER BADGE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(
                                    title: Text(
                                        'Affiche le clavier lors de la saisi dans le champ badge.')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'POINTEUSE',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('LANGUE SONS',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(
                                    title: Text(
                                        'Permet la modification de la langue des sons de la pointeuse.')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'PLANING',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('PAGE LIVE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(title: Text(' Activer la page LIVE')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'PLANING',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('PAGE LIVE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(title: Text(' Activer la page LIVE')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'PLANING',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('PAGE LIVE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(title: Text(' Activer la page LIVE')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'PLANING',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('PAGE LIVE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(title: Text(' Activer la page LIVE')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'PLANING',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('PAGE LIVE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(title: Text(' Activer la page LIVE')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'PLANING',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('PAGE LIVE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(title: Text(' Activer la page LIVE')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Container(
                            height: 135,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.grey,
                                  ],
                                )),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: ExpansionTile(
                              backgroundColor: Color(0xffd3d3d3),
                              title: const Text(
                                'PLANING',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text('PAGE LIVE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
// trailing: Icon(
//   _customTileExpanded
//       ? Icons.arrow_drop_down_circle
//       : Icons.arrow_drop_down,
// ),
                              children: const <Widget>[
                                ListTile(title: Text(' Activer la page LIVE')),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() => _customTileExpanded = expanded);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
