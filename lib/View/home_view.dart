import 'package:flutter/material.dart';
import 'Restaurant.dart';
import 'Widget/clock.dart';
import 'Widget/digital_clock.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          const Color(0xFF0159AA),
          const Color(0xFFdbe1ff),
          const Color(0xFFFFFFFF),
        ])),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 54, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),

              AnalogClock(),
              DigitalClock(),
              SizedBox(
                height: 15,
              ),
              Text(
                ' Badging',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "Entrer votre  code ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 30,
              ),
              // TextFormField(
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //       borderSide: BorderSide(color: Colors.grey),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //       borderSide: BorderSide(color: Colors.blue),
              //     ),
              //     fillColor: Colors.grey[200],
              //     filled: true,
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(225, 95, 27, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10))
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Restaurant()),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFdbe1ff)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF509DCD)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Entrer',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Container(
              //   margin: EdgeInsets.only(top: 20.0),
              //   child: ElevatedButton(
              //     child: Text(' Entrer'),
              //     style: ElevatedButton.styleFrom(
              //       minimumSize: Size(190, 50),
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //       textStyle: const TextStyle(
              //           color: Color(0xff3b5ce4),
              //           fontSize: 30,
              //           fontWeight: FontWeight.bold,
              //           fontStyle: FontStyle.normal),
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => Restaurant()),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: false,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.deepOrange),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
