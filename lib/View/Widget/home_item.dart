import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final String title;
  final Color boxColor;

  HomeItem({
    required this.title,
    required this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            height: 150,
            width: 650,
            decoration: BoxDecoration(
                color: boxColor, borderRadius: BorderRadius.circular(10.0)),
            // decoration: BoxDecoration(
            //   border: Border.all(color: boxColor),
            //   borderRadius: BorderRadius.circular(10),
            //   // color: Colors.grey,
            // ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
