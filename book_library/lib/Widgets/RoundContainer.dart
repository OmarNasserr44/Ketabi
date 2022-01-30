import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    required this.screenSize,
    required this.text,
    this.longText = false,
  });

  final Size screenSize;
  final String text;
  final bool longText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bannerColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenSize.width / 2),
              bottomRight: Radius.circular(screenSize.width / 2))),
      child: Column(
        children: [
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize:
                      longText ? screenSize.width / 4 : screenSize.width / 3,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      height: screenSize.height / 2.5,
      width: double.infinity,
    );
  }
}
