import 'package:book_library/GetX/GetX.dart';
import 'package:book_library/Requests/Firebase.dart';
import 'package:book_library/Requests/SignInUpFirebase.dart';
import 'package:book_library/constants/QuizQuestions.dart';
import 'package:get/get.dart';

class AllControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerGetX>(() => ControllerGetX());
    Get.lazyPut<FirebaseController>(() => FirebaseController());
    Get.lazyPut<QuestionsController>(() => QuestionsController());
    Get.lazyPut<SignInUp>(() => SignInUp());
  }
}
