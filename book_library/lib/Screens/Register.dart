import 'package:book_library/Requests/SignInUpFirebase.dart';
import 'package:book_library/Widgets/BackArrow.dart';
import 'package:book_library/Widgets/CustTextField.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'Register2.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final signInUPController = Get.find<SignInUp>();

  @override
  void initState() {
    signInUPController.schoolName = "";
    signInUPController.userName = "";
    signInUPController.grade = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGColor3,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Stack(
                children: [
                  BackArrow(screenSize: screenSize),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenSize.width / 3.9,
                              top: screenSize.height / 10),
                          child: Container(
                            child: Text(
                              "الاشتراك",
                              style: TextStyle(
                                  fontSize: screenSize.width / 5,
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
                          hintText: "اسم الطالب",
                          onChanged: (text) {
                            signInUPController.userName = text;
                            print(signInUPController.validationError[0]);
                          },
                          validError: "name",
                          showError: 0,
                        ),
                        SizedBox(
                          height: screenSize.height / 35,
                        ),
                        CustTextField(
                          screenSize: screenSize,
                          hintText: "اسم المدرسة",
                          onChanged: (text) {
                            signInUPController.schoolName = text;
                          },
                          validError: "else",
                          showError: 1,
                        ),
                        SizedBox(
                          height: screenSize.height / 35,
                        ),
                        CustTextField(
                          screenSize: screenSize,
                          hintText: "المرحلة الدراسية",
                          onChanged: (text) {
                            signInUPController.grade = text;
                          },
                          validError: "else",
                          showError: 2,
                        ),
                        // SizedBox(
                        //   height: screenSize.height / 35,
                        // ),
                        // CustTextField(
                        //   screenSize: screenSize,
                        //   hintText: "السجل المدني",
                        //   onChanged: (text) {
                        //     signInUPController.id = text;
                        //   },
                        //   validError: "id",
                        //   showError: 3,
                        // ),
                        SizedBox(
                          height: screenSize.height / 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (signInUPController.userName.length < 4) {
                              signInUPController.validationError[0] = true;
                            } else if (signInUPController.userName.length >=
                                4) {
                              signInUPController.validationError[0] = false;
                            }
                            if (signInUPController.schoolName.length < 4) {
                              signInUPController.validationError[1] = true;
                            } else if (signInUPController.schoolName.length >=
                                4) {
                              signInUPController.validationError[1] = false;
                            }
                            if (signInUPController.grade.length < 2) {
                              signInUPController.validationError[2] = true;
                            } else if (signInUPController.grade.length > 2) {
                              signInUPController.validationError[2] = false;
                            }
                            // if (signInUPController.id.length > 10 ||
                            //     signInUPController.id.length < 10) {
                            //   signInUPController.validationError[3] = true;
                            // } else if (signInUPController.id.length == 10) {
                            //   signInUPController.validationError[3] = false;
                            // }
                            if (signInUPController
                                        .validationError[0] ==
                                    false &&
                                signInUPController.validationError[1] ==
                                    false &&
                                signInUPController.validationError[2] ==
                                    false) {
                              Get.to(() => RegisterPage2());
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: bannerColor,
                                content: Text(
                                  "برجاء ادخال القيم المطلوبة بشكل صحيح",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenSize.width / 20),
                                ),
                              ));
                            }
                          },
                          height: screenSize.height / 15,
                          minWidth: screenSize.width / 1.3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color(0xFFFF9292),
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                            size: screenSize.width / 5,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
