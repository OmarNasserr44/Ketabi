import 'package:book_library/Widgets/BookView.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BooksScreen extends StatelessWidget {
  BooksScreen({required this.bookName, required this.bookImage});

  final List<String> bookName;
  final List<String> bookImage;

  List<Widget> books = [];

  List<Widget> noBooks(Size screenSize) {
    books = [];
    for (int i = 0; i < bookName.length; i++) {
      books.add(
        BookView(
          screenSize: screenSize,
          bookName: bookName[i],
          imageURL: bookImage[i],
        ),
      );
    }
    return books;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backGColor2,
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: noBooks(screenSize),
              ),
            )
          ],
        ),
      ),
    );
  }
}
