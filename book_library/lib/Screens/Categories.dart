import 'package:book_library/GetX/GetX.dart';
import 'package:book_library/Screens/DeleteAcc.dart';
import 'package:book_library/Widgets/BackArrow.dart';
import 'package:book_library/Widgets/Button.dart';
import 'package:book_library/Widgets/CategoryBox.dart';
import 'package:book_library/Widgets/RoundContainer.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'Register.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final categoryController = Get.find<ControllerGetX>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(ControllerGetX());
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGColor2,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  RoundContainer(
                    screenSize: screenSize,
                    text: "تصنيفات الكتب",
                    longText: true,
                  ),
                  BackArrow(
                    screenSize: screenSize,
                    pdf: 3,
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height / 2,
                width: screenSize.width / 1.1,
                child: ListView(
                  children: [
                    SizedBox(height: screenSize.height / 45),
                    CategoryBox(
                      screenSize: screenSize,
                      text: "التقنيات والحاسوب",
                      margin: screenSize.width / 9,
                      category: "Technologies-and-computers",
                    ),
                    SizedBox(
                      height: screenSize.height / 25,
                    ),
                    CategoryBox(
                      margin: screenSize.width / 20,
                      screenSize: screenSize,
                      text: "التنمية وتطوير الذات",
                      category: "development-and-self-development",
                    ),
                    SizedBox(
                      height: screenSize.height / 25,
                    ),
                    CategoryBox(
                      margin: screenSize.width / 6.5,
                      screenSize: screenSize,
                      text: "الجغرافيا والتاريخ",
                      category: "geography-and-history",
                    ),
                    SizedBox(
                      height: screenSize.height / 25,
                    ),
                    CategoryBox(
                      margin: screenSize.width / 3.4,
                      screenSize: screenSize,
                      text: "الصحة والطب",
                      category: "health-and-medicine",
                    ),
                    SizedBox(
                      height: screenSize.height / 25,
                    ),
                    CategoryBox(
                      margin: screenSize.width / 3.6,
                      screenSize: screenSize,
                      text: "العلوم الشرعية",
                      category: "Forensic-sciences",
                    ),
                    SizedBox(
                      height: screenSize.height / 25,
                    ),
                    CategoryBox(
                      margin: screenSize.width / 7.3,
                      screenSize: screenSize,
                      text: "القصص والروايات",
                      category: "Stories-and-novels",
                    ),
                    SizedBox(
                      height: screenSize.height / 25,
                    ),
                    Button(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DeleteAcc()));
                      },
                      screenSize: screenSize,
                      text: "حذف الحساب",
                    ),
                    SizedBox(
                      height: screenSize.height / 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
