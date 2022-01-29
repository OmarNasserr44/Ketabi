import 'dart:convert';
import 'dart:developer';
import 'package:book_library/Requests/SignInUpFirebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:http/http.dart' as http;

class ControllerGetX extends GetxController {
  String categoryName = "".obs();
  String bookNameForQuiz = "".obs();
  String quizResult = ''.obs();

  var userController = Get.find<SignInUp>();

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                "Loading",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void>? sendEmail() async {
    SmtpServer smtpServer;
    final gmailname = "ketabiapplication@gmail.com";

    // ignore: deprecated_member_use
    smtpServer = gmail(gmailname, 'ketabiapplication1');

    final message = Message()
      ..from = Address(gmailname, 'Ketabi')
      ..recipients.add('omarnasserr44@gmail.com')
      ..subject = 'Ketabi Team ${DateTime.now().toString().substring(0, 10)}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          '''<h1>نتيجة الطالب ${userController.userName}</h1><span>حصل الطالب على نتيجة ${Get.find<ControllerGetX>().quizResult} في اختبار كتاب ${Get.find<ControllerGetX>().bookNameForQuiz}         </span><span> رقم السجل المدني${userController.id}                               </span><span> المرحلة المدرسية  ${userController.grade}</span><span> اسم المدرسة ${userController.schoolName}</span>''';

    try {
      final sendReport = await send(message, smtpServer);
      log('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  Future? emailSend() async {
    final serviceID = 'service_6fzvcvm';
    final templateID = 'template_v18elch';
    final userID = 'user_q5BXJSCyTeHHyXca9XEzM';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceID,
          'template_id': templateID,
          'user_ID': userID,
          'template-params': {
            'user_subject': 'FLUTTER APP',
            'message': 'message',
          }
        }));
    print("RESP ${response.statusCode}");
  }

  void category(String name) {
    categoryName = name;
  }
}
