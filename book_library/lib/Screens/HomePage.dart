import 'package:book_library/GetX/GetX.dart';
import 'package:book_library/Screens/Categories.dart';
import 'package:book_library/Screens/LogInScreen.dart';
import 'package:book_library/Screens/Register.dart';
import 'package:book_library/Widgets/Button.dart';
import 'package:book_library/Widgets/RoundContainer.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                RoundContainer(
                  screenSize: screenSize,
                  text: "كتابي",
                ),
                Container(
                    child: Column(children: [
                  SizedBox(
                    height: screenSize.height / 5,
                  ),
                  Button(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    screenSize: screenSize,
                    text: "تسجيل الدخول",
                  ),
                  SizedBox(
                    height: screenSize.height / 35,
                  ),
                  Button(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    screenSize: screenSize,
                    text: "الاشتراك",
                  ),
                  SizedBox(
                    height: screenSize.height / 35,
                  ),
                  Button(
                    onTap: () {
                      Get.find<ControllerGetX>().fromGuest = true;
                      Get.to(() => CategoriesScreen());
                    },
                    screenSize: screenSize,
                    text: "حساب زائر",
                  ),
                ]))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
