import 'package:book_library/Requests/SignInUpFirebase.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CustTextField extends StatefulWidget {
  CustTextField({
    required this.screenSize,
    required this.hintText,
    required this.onChanged,
    required this.validError,
    required this.showError,
  });

  final Size screenSize;
  final String hintText;
  final Function(String) onChanged;
  final String validError;
  final int showError;

  @override
  State<CustTextField> createState() => _CustTextFieldState();
}

class _CustTextFieldState extends State<CustTextField> {
  Map<String, String> error = {
    "email": "يجب ان يحتوي على رقم السجل المدني@ketabi.com",
    "id": "يجب ان يتكون رقم السجل المدني من عشرة ارقام",
    "name": "يجب الا يقل اسم الطالب عن اربعة احرف",
    "pass": "يجب الا تقل كلمة المرور عن 8 ارقام",
    "else": "يجب الا يترك خاليا"
  };

  final signInUPController = Get.find<SignInUp>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenSize.height / 15,
      width: widget.screenSize.width / 1.3,
      decoration: BoxDecoration(
          color: backGColor3,
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: Directionality(
        textDirection: widget.validError == 'email'
            ? TextDirection.rtl
            : TextDirection.rtl,
        child: TextField(
          inputFormatters: widget.validError == 'id'
              ? [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ]
              : [
                  FilteringTextInputFormatter.deny(RegExp(r'[/]')),
                ],
          keyboardType: widget.validError == 'id'
              ? TextInputType.number
              : TextInputType.text,
          onChanged: widget.onChanged,
          maxLength: widget.validError == 'id'
              ? 10
              : widget.validError == 'email'
                  ? 21
                  : 15,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.all(10.0),
            // border: InputBorder.none,
            hintText: widget.hintText,
            errorText: signInUPController.validationError[widget.showError]
                ? error[widget.validError]
                : null,
            hintStyle: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          cursorColor: Colors.white,
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
