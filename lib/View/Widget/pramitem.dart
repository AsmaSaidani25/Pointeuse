import 'package:flutter/material.dart';

class paramItem extends StatefulWidget {
  final String firstText;
  final String secondText;
  final Widget placeholder;

  const paramItem({
    required Key key,
    required this.firstText,
    required this.secondText,
    required this.placeholder,
  }) : super(key: key);

  @override
  _MyCardItemState createState() => _MyCardItemState();
}

class _MyCardItemState extends State<paramItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.firstText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.secondText,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            widget.placeholder,
          ],
        ),
      ),
    );
  }
}
