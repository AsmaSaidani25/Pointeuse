import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  const Box({required this.name, Key? key}) : super(key: key);
  final String name;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: BoxConstraints(
          minWidth: 16,
          minHeight: 16,
        ),
        child: Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                width: 150,
                child: Text(
                  widget.name,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  // textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 320),
              Container(
                width: 60,
                child: Checkbox(
                  value: isChecked,
                  activeColor: Colors.orangeAccent,
                  tristate: true,
                  onChanged: (bool? newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
              ),
              // SizedBox(width: 35),
              // Container(
              // width: 20,
              // child: IconButton(
              //   color: Colors.orangeAccent,
              //   icon: Icon(Icons.message),
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Envoyer Votre Message'),
              //           content: TextField(
              //             decoration: InputDecoration(
              //               hintText: 'Ecrire ton message ici...',
              //             ),
              //           ),
              //           actions: <Widget>[
              //             TextButton(
              //               child: Text('Annuler'),
              //               onPressed: () {
              //                 Navigator.of(context).pop();
              //               },
              //             ),
              //             TextButton(
              //               child: Text('Envoyer'),
              //               onPressed: () {
              //                 // Do something when the send button is pressed.
              //                 Navigator.of(context).pop();
              //               },
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   },
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
