import 'package:book_library/GetX/GetX.dart';
import 'package:book_library/Requests/SignInUpFirebase.dart';
import 'package:book_library/Screens/Categories.dart';
import 'package:book_library/Widgets/Button.dart';
import 'package:book_library/Widgets/CustTextField.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

// ignore: must_be_immutable
class DeleteAcc extends StatelessWidget {
  final signInUPController = Get.find<SignInUp>();

  String tempEmail = "";
  String tempPass = "";
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGColor3,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: screenSize.width / 20,
                          top: screenSize.height / 10),
                      child: Container(
                        child: Text(
                          "حذف الحساب",
                          style: TextStyle(
                              fontSize: screenSize.width / 6,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height / 20,
                    ),
                    CustTextField(
                      screenSize: screenSize,
                      hintText: "البريد الالكتروني الحالي",
                      onChanged: (text) {
                        tempEmail = text;
                      },
                      validError: "email",
                      showError: 4,
                    ),
                    SizedBox(
                      height: screenSize.height / 35,
                    ),
                    CustTextField(
                      screenSize: screenSize,
                      hintText: "كلمة المرور للتأكيد",
                      onChanged: (text) {
                        tempPass = text;
                      },
                      validError: "pass",
                      showError: 5,
                    ),
                    SizedBox(
                      height: screenSize.height / 10,
                    ),
                    Button(
                      //Push to Firebase
                      screenSize: screenSize,
                      text: "حذف الحساب",
                      color: Color(0xFFFF9292),
                      onTap: () async {
                        Get.find<ControllerGetX>().showAlertDialog(context);
                        if (tempEmail == signInUPController.email &&
                            tempPass == signInUPController.password) {
                          try {
                            signInUPController.deleteUser();
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: bannerColor,
                              content: Text(
                                "تم حذف المستخدم بنجاح",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenSize.width / 20),
                              ),
                            ));
                          } on Exception catch (e) {
                            Navigator.pop(context);
                            print('error on deleting user: $e');
                          }
                        } else {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: bannerColor,
                            content: Text(
                              "برجاء ادخال بيانات المستخدم الحالي",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenSize.width / 20),
                            ),
                          ));
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
