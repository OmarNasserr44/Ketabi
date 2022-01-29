import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.screenSize,
    required this.text,
    required this.onTap,
    this.color = buttonColor,
  });

  final Size screenSize;
  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width / 15,
              fontWeight: FontWeight.bold),
        )),
        height: screenSize.height / 15,
        width: screenSize.width / 1.3,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      ),
    );
  }
}
