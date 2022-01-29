import 'package:book_library/GetX/GetX.dart';
import 'package:book_library/Requests/Firebase.dart';
import 'package:book_library/Screens/ReadorQuiz.dart';
import 'package:book_library/constants/QuizQuestions.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

// ignore: must_be_immutable
class BookView extends StatelessWidget {
  BookView({
    required this.screenSize,
    required this.imageURL,
    required this.bookName,
  });

  final Size screenSize;
  final String imageURL;
  final String bookName;

  var firebaseControl = Get.find<FirebaseController>();
  final categoryController = Get.find<ControllerGetX>();
  final questionController = Get.find<QuestionsController>();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        categoryController.showAlertDialog(context);
        String url = "Books/${categoryController.categoryName}/$bookName.pdf";
        await firebaseControl.downloadURL(url);
        categoryController.bookNameForQuiz = bookName;
        questionController.assignQuestions();
        Navigator.pop(context);
        Get.to(() => ReadorQuiz());
      },
      child: Padding(
        padding: EdgeInsets.only(top: screenSize.height / 15),
        child: Material(
          elevation: 15,
          child: Container(
            height: screenSize.height / 3,
            width: screenSize.width / 2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Container(
                  height: screenSize.height / 4,
                  width: screenSize.width / 2,
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Container(
                  height: screenSize.height / 12,
                  width: screenSize.width / 2,
                  decoration: BoxDecoration(
                      color: belowBookColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Center(
                      child: SizedBox(
                        height: screenSize.height / 12,
                        width: screenSize.width / 2.2,
                        child: Text(
                          bookName,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: screenSize.width / 18,
                              fontWeight: FontWeight.bold,
                              color: bookNameColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
