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
import 'package:get/get_navigation/src/extension_navigation.dart';

class RegisterPage2 extends StatefulWidget {
  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final signInUPController = Get.find<SignInUp>();

  final _auth = FirebaseAuth.instance;

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
                          hintText: "0123456789@ketabi.com",
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
                          hintText: "كلمة المرور",
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
                          text: "تسجيل",
                          color: Color(0xFFFF9292),
                          onTap: () async {
                            if (signInUPController.email.length < 21 ||
                                !signInUPController.email
                                    .contains('@ketabi.com') ||
                                !signInUPController.email
                                    .contains(signInUPController.id)) {
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
                                UserCredential newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: signInUPController.email,
                                        password: signInUPController.password);
                                signInUPController.inputData();

                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Get.find<ControllerGetX>().fromGuest = false;
                                Get.to(() => CategoriesScreen());
                              } on Exception catch (signUpError) {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: bannerColor,
                                  content: Text(
                                    "الايميل الذي ادخلته مسجل بالفعل\nالرجاء التوجه الى صفحة تسجيل الدخول",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenSize.width / 20),
                                  ),
                                ));
                                print('Failed to create New User $signUpError');
                              }
                            } else {
                              print("HERE");
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
