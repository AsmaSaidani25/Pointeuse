import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const TabItem({required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: Colors.white, size: 30),
        Text(text, style: TextStyle(color: Colors.white, fontSize: 12))
      ],
    );
  }
}
