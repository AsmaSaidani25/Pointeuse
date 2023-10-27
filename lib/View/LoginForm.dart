import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pointeuse/Controller/FadeAnimation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Restaurant.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  late String _email;
  late String _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _responseText = "";
  var dbHelper;

  late final http.Client httpClient = http.Client();

  // void _onLoginPressed(BuildContext context) {
  //    final String email = _emailController.text.trim();
  //    final String password = _passwordController.text.trim();

  /*   if (email.isNotEmpty && password.isNotEmpty) {
      final loginController =
          Provider.of<LoginController>(context, listen: false);
      loginController.login(email, password);
    }*/
  //}
  Future<void> saveBearerToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('bearerToken', token);
  }

  Future<void> _login() async {
    // if (_keyForm.currentState!.validate()) {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // ... (Your existing code to show empty email/password error)
    } else {
      final Map<String, String> userData = {
        "email": email,
        "password": password,
      };
      final Map<String, String> headers = {
        "Content-Type": "application/json",
      };
      final String jsonData = jsonEncode(userData);

      try {
        final response = await http.post(
          Uri.parse('https://preprod.myrhis.fr/security/user/techConnexion'),
          body: jsonData,
          headers: headers,
        );

        if (response.statusCode == 200) {
          final jsonResponse = jsonDecode(response.body);
          final token = response.headers['authorization'];

          // Save the token
          //await saveBearerToken(token);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Restaurant()),
          );
          setState(() {
            _responseText = jsonResponse.toString();
          });
        } else if (response.statusCode == 400) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("Information"),
                  content: Text("Password is incorrect"),
                );
              });
        } else if (response.statusCode == 401) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("Information"),
                  content: Text("Email doesn't exist"),
                );
              });
        } else {
          // Handle other status codes if needed
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("An error occurred. Please try again!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        // Handle any exception that occurs during the API call
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        // key: _keyForm,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          const Color(0xFF0159AA),
          const Color(0xFFdbe1ff),
          const Color(0xFFFFFFFF),
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FadeAnimation(
                        1.3,
                        Image.asset(
                          'assets/images/logo-solutions2-1.png',
                          width: 200,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                  FadeAnimation(
                      1,
                      Text(
                        "CONNEXION",
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "BON RETOUR",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: const Color(0xFFC8C8C8),
                                    ))),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: "Email ",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email),
                                        labelText: ("Email"),
                                      ),
                                      controller: _emailController,
                                      /*   onSaved: (String? value) {
                                        _email = value.toString();
                                      },
                                      validator: (value) {
                                        print(
                                            "Validator called with value: $value");
                                        if (value == null || value.isEmpty) {
                                          return "Email ne doit pas etre vide";
                                        } else if (!RegExp(pattern)
                                            .hasMatch(value)) {
                                          return "Email incorrect";
                                        }
                                        return null; // Return null if validation is successful
                                      },*/
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    const Color(0xFFC8C8C8)))),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Mot De Passe",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.password),
                                        labelText: ("Mot de passe"),
                                      ),
                                      controller: _passwordController,
                                      obscureText: true,
                                      /*  onSaved: (String? value) {
                                        _password = value.toString();
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return "Password ne doit pas etre vide";
                                        } else if (value.length < 5) {
                                          return "Password doit avoir au moins 5 caractères";
                                        } else {
                                          return null;
                                        }
                                      },*/
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                          1.6,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _login(),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFF509DCD)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Text(
                                  'Connexion',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        //  Text(_responseText),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
