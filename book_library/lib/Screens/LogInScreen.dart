import 'package:book_library/GetX/GetX.dart';
import 'package:book_library/Requests/SignInUpFirebase.dart';
import 'package:book_library/Screens/Categories.dart';
import 'package:book_library/Widgets/BackArrow.dart';
import 'package:book_library/Widgets/Button.dart';
import 'package:book_library/Widgets/CustTextField.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final signInUPController = Get.find<SignInUp>();

  UserCredential? userCredential;
  @override
  void initState() {
    signInUPController.email = "";
    signInUPController.password = "";
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
                              "التسجيل",
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
                          hintText: "البريد الالكتروني",
                          onChanged: (text) {
                            signInUPController.email = text;
                          },
                          validError: "email",
                          showError: 4,
                        ),
                        SizedBox(
                          height: screenSize.height / 35,
                        ),
                        CustTextField(
                          screenSize: screenSize,
                          hintText: "كلمة  المرور",
                          onChanged: (text) {
                            signInUPController.password = text;
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
                          text: "تسجيل الدخول",
                          color: Color(0xFFFF9292),
                          onTap: () async {
                            if (signInUPController.email.length < 21 ||
                                !signInUPController.email
                                    .contains('@ketabi.com')) {
                              signInUPController.validationError[4] = true;
                            } else {
                              signInUPController.validationError[4] = false;
                            }
                            if (signInUPController.password.length < 8) {
                              signInUPController.validationError[5] = true;
                            } else {
                              signInUPController.validationError[5] = false;
                            }
                            if (signInUPController.validationError[4] ==
                                    false &&
                                signInUPController.validationError[5] ==
                                    false) {
                              Get.put(ControllerGetX());
                              Get.find<ControllerGetX>()
                                  .showAlertDialog(context);
                              try {
                                try {
                                  userCredential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: signInUPController.email,
                                    password: signInUPController.password,
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                }
                                if (userCredential != null) {
                                  await signInUPController.currentUserData();

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Get.find<ControllerGetX>().fromGuest = false;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          CategoriesScreen()));
                                } else {
                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: bannerColor,
                                    content: Text(
                                      "لا يوجد مستخدم بهذه البيانات\nبرجاء الاشتراك اولا",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenSize.width / 20),
                                    ),
                                  ));
                                }
                              } on Exception catch (e) {
                                print('Failed to create New User $e');
                              }
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
