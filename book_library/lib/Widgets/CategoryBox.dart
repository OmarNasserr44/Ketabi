import 'package:book_library/Requests/Firebase.dart';
import 'package:book_library/GetX/GetX.dart';
import 'package:book_library/Screens/BooksScreen.dart';
import 'package:book_library/constants/QuizQuestions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

// ignore: must_be_immutable
class CategoryBox extends StatelessWidget {
  CategoryBox({
    required this.screenSize,
    required this.text,
    required this.margin,
    this.category = '',
  });

  final Size screenSize;
  final String text;
  final double margin;
  final String category;

  final categoryController = Get.find<ControllerGetX>();
  var firebaseControl = Get.find<FirebaseController>();

  List<String> booksNames = [];
  List<String> booksImagesURL = [];
  List<dynamic> urlsToBeDownloaded = [];

  getBooksNames() {
    Get.put(FirebaseController());
    booksNames = [];
    for (int i = 0; i < firebaseControl.references.length; i++) {
      var temp = firebaseControl.references[i].toString();
      var index = temp.split('/');
      booksNames.add(index[2].substring(0, index[2].length - 5));
      print(booksNames[i]);
    }
  }

  Future<void> getBooksImages() async {
    Get.put(FirebaseController());
    booksImagesURL = [];
    for (int i = 0; i < firebaseControl.references.length; i++) {
      var temp = firebaseControl.references[i].toString();
      var index = temp.split('/');
      var url = 'BookImages/${index[2].substring(0, index[2].length - 5)}.jpeg';
      await firebaseControl.downloadURL(url);
      print(firebaseControl.url);
      booksImagesURL.add(firebaseControl.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        categoryController.showAlertDialog(context);

        Get.find<ControllerGetX>().category(category);
        Get.put(FirebaseController());
        await firebaseControl.listExample();

        getBooksNames();

        await getBooksImages();
        Get.lazyPut(() => QuestionsController());

        Navigator.pop(context);

        Get.to(() => BooksScreen(
              bookImage: booksImagesURL,
              bookName: booksNames,
            ));
      },
      child: Material(
        elevation: 5,
        child: Container(
          height: screenSize.height / 10,
          width: screenSize.width / 1.1,
          child: Row(
            children: [
              Container(
                color: Colors.grey,
                height: screenSize.height / 10,
                width: screenSize.width / 30,
              ),
              SizedBox(
                width: margin,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenSize.width / 10,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
