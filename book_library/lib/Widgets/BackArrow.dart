import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class BackArrow extends StatelessWidget {
  BackArrow({
    required this.screenSize,
    this.pdf = 0,
  });
  final Size screenSize;
  final int pdf;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: pdf != 3 ? screenSize.height / 20 : screenSize.height / 7,
      left: screenSize.width / 20,
      child: GestureDetector(
        onTap: () {
          Get.back();
          // if (pdf == 2) {
          //   Navigator.pop(context);
          // }
        },
        child: Icon(
          Icons.arrow_back,
          size: screenSize.width / 10,
          color: pdf != 2 ? Colors.white : Colors.blue[900],
        ),
      ),
    );
  }
}
