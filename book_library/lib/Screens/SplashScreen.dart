import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:book_library/Screens/HomePage.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
        splash: Container(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              Center(
                child: Container(
                    height: screenSize.height / 3,
                    width: screenSize.width / 1.5,
                    child: Image.asset(
                      "assets/Ketabi.png",
                      fit: BoxFit.fill,
                    )),
              ),
              Text(
                'Ketabi',
                style: TextStyle(
                    fontSize: screenSize.width / 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
        backgroundColor: bannerColor,
        splashIconSize: screenSize.width / 1,
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.topToBottom,
        nextScreen: HomePage());
  }
}
