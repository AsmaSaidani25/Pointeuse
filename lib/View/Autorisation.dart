import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Autorisation extends StatefulWidget {
  const Autorisation({Key? key}) : super(key: key);

  @override
  _AutorisationState createState() => _AutorisationState();
}

class _AutorisationState extends State<Autorisation> {
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('d.MM.yyyy');
    final String formattedDate = formatter.format(now);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('  $formattedDate'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Planing Screen"),
      ),
    );
  }
}
