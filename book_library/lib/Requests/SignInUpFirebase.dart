import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUp extends GetxController {
  String userName = ''.obs();
  String schoolName = ''.obs();
  String grade = ''.obs();
  String id = ''.obs();
  String email = ''.obs();
  String password = ''.obs();

  List<bool> validationError = [
    true,
    true,
    true,
    true,
    true,
    true,
  ].obs();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void inputData() async {
    try {
      final User? user = auth.currentUser;
      await firestore.collection("User Information").doc(user?.uid).set({
        "ID": Get.find<SignInUp>().id,
        "Name": Get.find<SignInUp>().userName,
        "School Name": Get.find<SignInUp>().schoolName,
        "grade": Get.find<SignInUp>().grade,
      });
    } on Exception catch (e) {
      print('ERROR IN INPUT DATA $e');
    }
  }

  Future<void> currentUserData() async {
    final User? user = auth.currentUser;
    try {
      await firestore
          .collection("User Information")
          .doc(user?.uid)
          .get()
          .then((value) {
        if (!value.exists) {
          print("something went Wrong");
        }
        if (value.exists) {
          Map<String, dynamic>? data = value.data();
          Get.find<SignInUp>().userName = data?['Name'];
          Get.find<SignInUp>().id = data?['ID'];
          Get.find<SignInUp>().schoolName = data?['School Name'];
          Get.find<SignInUp>().grade = data?['grade'];
        }
      });
    } on Exception catch (e) {
      print("FAILED $e");
    }
  }
}
