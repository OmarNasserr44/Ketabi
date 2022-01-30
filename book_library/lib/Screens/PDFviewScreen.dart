import 'dart:async';

import 'package:book_library/Widgets/BackArrow.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFviewScreen extends StatefulWidget {
  final String doc;

  const PDFviewScreen({required this.doc});
  @override
  _PDFviewScreenState createState() => _PDFviewScreenState(doc: doc);
}

class _PDFviewScreenState extends State<PDFviewScreen> {
  final String doc;

  _PDFviewScreenState({required this.doc});

  final StreamController<String> _pageCountController =
      StreamController<String>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: white,
          elevation: 0,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: screenSize.width / 10,
                color: Colors.blue[900],
              ),
            ),
            StreamBuilder<String>(
                stream: _pageCountController.stream,
                builder: (_, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue[900],
                        ),
                        child: Text(snapshot.data!),
                      ),
                    );
                  }
                  return const SizedBox();
                }),
          ],
        ),
        backgroundColor: white,
        body: SafeArea(
          child: PDF(
            onPageChanged: (int? current, int? total) =>
                _pageCountController.add('${current! + 1} - $total'),
          ).fromUrl(
            doc,
            placeholder: (double progress) =>
                Center(child: Text('$progress %')),
            errorWidget: (dynamic error) =>
                Center(child: Text(error.toString())),
          ),
        ));
  }
}
