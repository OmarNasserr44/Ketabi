// ignore_for_file: must_be_immutable

import 'package:book_library/Requests/Firebase.dart';
import 'package:book_library/Screens/Quiz.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'PDFviewScreen.dart';

class ReadorQuiz extends StatelessWidget {
  var firebaseControl = Get.find<FirebaseController>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backGColor2,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height / 24,
            ),
            ReadQuizWiget(
              screenSize: screenSize,
              text: 'اقــرأ الـكـتاب',
              onTap: () {
                Get.to(() => PDFviewScreen(doc: firebaseControl.url));
              },
            ),
            SizedBox(
              height: screenSize.height / 15,
            ),
            ReadQuizWiget(
              screenSize: screenSize,
              text: 'الامتحـــان',
              onTap: () {
                Get.to(() => QuizScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}

class ReadQuizWiget extends StatelessWidget {
  ReadQuizWiget({
    required this.screenSize,
    required this.text,
    required this.onTap,
  });

  final Size screenSize;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenSize.height / 2.5,
        width: screenSize.width,
        decoration: BoxDecoration(
            color: bannerColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width / 6,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
