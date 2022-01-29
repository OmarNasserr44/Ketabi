import 'package:book_library/GetX/GetX.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseController extends GetxController {
  String url = ''.obs();

  List<dynamic> references = [0].obs();

  Future<void> listExample() async {
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("Books")
        .child(Get.find<ControllerGetX>().categoryName)
        .listAll();

    result.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });
    references = result.items;
    result.prefixes.forEach((firebase_storage.Reference ref) {
      print('Found directory: $ref');
    });
  }

  Future<void> downloadURL(String parameterURL) async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref(parameterURL)
        .getDownloadURL();

    url = downloadURL;
  }

  // Future<void> downloadIamgeURL(String )
}
