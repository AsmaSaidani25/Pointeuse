import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pointeuse/DatabaseHandler/DbHelper.dart';
import 'package:pointeuse/Model/RestaurantGUI.model.dart';
import 'package:pointeuse/Services/RestaurantService.dart';
import 'package:pointeuse/Services/Session.service.dart';
import 'curved_nav_bar.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<Map<String, dynamic>> data =
      []; // Initialize an empty list to hold your data
  int _value = 1;
  int? _selectedValue;
  List<RestaurantGUI> restaurantGUIList = []; // Your list of RestaurantGUI
  late String RestoSelected;
  ScrollController restoScrollConttroller = ScrollController();
  List<String> libelleResto = [];
  List<String> uniqueLibelleResto = [];
  RestaurantGUI? selectedRestaurant;

  final RestaurantService restaurantService = RestaurantService();
  final DbHelper dbHelper =
      DbHelper(); // Create an instance of your RestaurantService

  @override
  void initState() {
    super.initState();
    getData(); // Call getData when the widget is initialized
  }

  Future<void> saveSelectedRestaurantToDb() async {
    if (selectedRestaurant != null) {
      try {
        int? result = await dbHelper.saveSelectedRestaurant(
          selectedRestaurant!.libelle!,
          selectedRestaurant!.codePointeuse!,
        );
        if (result != null && result > 0) {
          print('Selected restaurant saved to SQLite');
        } else {
          print('Failed to save selected restaurant to SQLite');
        }
      } catch (error) {
        print('Error saving selected restaurant: $error');
      }
    } else {
      print('No restaurant selected');
    }
  }

  Future<bool> isAssociated(String codePointeuse) async {
    final response = await http.get(
        Uri.parse('https://qa.myrhis.fr/employee/restaurant/isAssoicieted/' +
            codePointeuse),
        headers: {
          'Authorization':
              'Bearer_RH_IS eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpc21haWwubWFuc291cmlAcmhpcy1zb2x1dGlvbnMuY29tIiwiYXVkIjoiNDMyMCIsImlzcyI6ImV5SmhiR2NpT2lKSVV6STFOaUo5LmV5SnpkV0lpT2lKU1JVWlNSVk5JWDFSUFMwVk9JaXdpYVhOeklqb2lhWE50WVdsc0xtMWhibk52ZFhKcFFISm9hWE10YzI5c2RYUnBiMjV6TG1OdmJTSXNJbVY0Y0NJNk1UWTVNamczT1RneU4zMC43QVN5V0Fpb3ZjbjRsYS1vTjRqdmRtcUQzM19BZ3JGLXhzNDA4MXVTSG1VIiwiZXhwIjoxNjkyODc5ODI3LCJhdXRob3JpdGllcyI6W119.iuwCcXRja-yfSugWGFxLJvs0c9Ja29ey3gKeqD7J81E',
        });
    print(response.body);
    if (response.statusCode == 200) {
      // Assuming response.body contains a boolean value indicating association
      return response.body.toLowerCase() == 'true';
    } else {
      // Handle the error case (e.g., request failed)
      return false; // Return false if there's an error
    }
  }

  Future<void> getData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://preprod.myrhis.fr/security/user/listrestaurants/ismail.mansouri@rhis-solutions.com'),
        headers: {
          'Authorization':
              'Bearer_RH_IS eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpc21haWwubWFuc291cmlAcmhpcy1zb2x1dGlvbnMuY29tIiwiYXVkIjoiNDMyMCIsImlzcyI6ImV5SmhiR2NpT2lKSVV6STFOaUo5LmV5SnpkV0lpT2lKU1JVWlNSVk5JWDFSUFMwVk9JaXdpYVhOeklqb2lhWE50WVdsc0xtMWhibk52ZFhKcFFISm9hWE10YzI5c2RYUnBiMjV6TG1OdmJTSXNJbVY0Y0NJNk1UWTVOelkwT0RZd09IMC5uX2xXSlo3R3NTQ3lIUC10UEY4b0c4elJudGxDYWlkOFhVWDFBR1ZjeHVZIiwiZXhwIjoxNjk3NjQ4NjA4LCJhdXRob3JpdGllcyI6W119._jLknb30LL9BAQqtXc3qg2qQzX1aNsYYN5KyEdHlsE4',
        },
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          restaurantGUIList =
              jsonData.map((json) => RestaurantGUI.fromJson(json)).toList();

          // Replace the existing libelleResto preparation code
          Set<String> uniqueLibelleResto = {};
          List<String> duplicateLibelleResto = [];

          for (String libelle in libelleResto) {
            if (!uniqueLibelleResto.contains(libelle)) {
              uniqueLibelleResto.add(libelle);
            } else {
              duplicateLibelleResto.add(libelle);
            }
          }

          if (duplicateLibelleResto.isNotEmpty) {
            print('Duplicate values found: $duplicateLibelleResto');
          }

          libelleResto = uniqueLibelleResto.toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void showAssociatedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resto Associated"),
          content: Text(
              "Ce restaurant est déjà associé à une pointeuse. Vous devez d'abord enlever l'association existante."),
          actions: <Widget>[
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

  void showNotAssociatedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resto Not Associated"),
          content: Text("The restaurant is not associated."),
          actions: <Widget>[
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

  /* final List _restoList = [
    "AAAAA",
    "BBBBB",
    "CCCCC",
    "DDDDD",
    "EEEEE",
    "FFFFF",
    "GGGGG",
    "HHHHH"
  ];*/
  String? _selectedVal;
  // Assuming this is where you populate the libelleResto list
  //List<String> libelleResto = fetchRestaurantNames(); // Replace with your logic

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              const Color(0xFF0159AA),
              const Color(0xFFdbe1ff),
              const Color(0xFFFFFFFF),
            ])),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 74, horizontal: 32),

          //    mainAxisAlignment: MainAxisAlignment.start,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Image.asset(
                'assets/images/logo-solutions2-1.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 5),
              Text(
                "Veuillez choisir votre restaurant",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(_selectedVal!),
              SizedBox(height: 60),
              Column(
                children: [
                  // Rest of your widgets
                  Container(
                    padding: EdgeInsets.all(90), // Adjust padding as needed
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(225, 95, 27, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DropdownButtonFormField<String>(
                        hint: Text("Select Resto"),
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedVal =
                                newValue; // Update the selected value
                            selectedRestaurant = restaurantGUIList.firstWhere(
                                (restaurant) => restaurant.libelle == newValue);
                            if (selectedRestaurant != null) {
                              print("Selected Restaurant:");
                              print("Libelle: ${selectedRestaurant!.libelle}");
                              print(
                                  "CodePointeuse: ${selectedRestaurant!.codePointeuse}");
                            }
                          });
                        },
                        value: _selectedVal,
                        items: restaurantGUIList.map((restaurant) {
                          return DropdownMenuItem<String>(
                            key: ValueKey<String>(restaurant.libelle!),
                            value: restaurant.libelle,
                            child: Text(restaurant.libelle ?? ""),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrange, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String codePointeuse = selectedRestaurant!.codePointeuse!;
                    bool isAssociatedResult = await isAssociated(codePointeuse);
                    if (isAssociatedResult) {
                      showAssociatedDialog();
                    } else {
                      showNotAssociatedDialog();
                    }
                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => curved_nav_bar()),
                      );
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF509DCD)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Ouvrir',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
              /* FloatingActionButton(onPressed: () {
                isAssociated(selectedRestaurant!.codePointeuse!);
              })*/
            ],
          ),
        ),
      ),
    );
  }
}
