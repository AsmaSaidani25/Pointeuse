import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pointeuse/View/LoginForm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Model/AuthProvider.dart';
import 'Services/Session.service.dart';
import 'View/Navigation_Bar.dart';
import 'View/Planing.dart';
import 'View/Restaurant.dart';
import 'View/home_view.dart';
import 'View/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionService.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown
  ]);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(), // Initialize the provider here
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      // home: SideBarLayout(),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) {
          return Splash();
        },
        "/homeview": (BuildContext context) {
          return HomeView();
        },
        "/resto": (BuildContext context) {
          return Provider.of<AuthProvider>(context).isLoggedIn
              ? Restaurant()
              : LoginForm(); // Replace with your login screen
        },
        "/nav": (BuildContext context) {
          return Navigation();
        },
        "/planing": (BuildContext context) {
          return Planing();
        },
      },
    );
  }
}
