import 'package:flutter/material.dart';

import 'LoginForm.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginForm()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF0159AA),
                const Color(0xFFdbe1ff),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/logo-solutions2-1.png",
                  height: 300.0,
                  width: 300.0,
                ),
                Text(
                  "Welcome to \n MyRhis Software",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),

      // body: Container(
      //   width: double.infinity,
      //   height: double.infinity,
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(begin: Alignment.topRight, colors: [
      //       Color(0xFF0159AA),
      //       Color(0xFFdbe1ff),
      //       const Color(0xFFFFFFFF),
      //     ]),
      //   ),
      //   child: AnimatedSplashScreen(
      //     //backgroundColor: Color(0xFFdbe1ff),
      //     splash: 'assets/images/logo-solutions2-1.png',
      //     nextScreen: LoginForm(),
      //     splashTransition: SplashTransition.sizeTransition,
      //     pageTransitionType: PageTransitionType.leftToRight,
      //   ),
      // ),
    );
  }
}
