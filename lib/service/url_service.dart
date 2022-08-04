// ignore_for_file: library_prefixes, deprecated_member_use

import 'package:url_launcher/url_launcher.dart' as UL;

class Utils {
  static Future<void> sendEmail(
      {required String email, String subject = "", String body = ""}) async {
    String mail = "mailto:$email?subject=$subject&body=${Uri.encodeFull(body)}";
    if (await UL.canLaunch(mail)) {
      await UL.launch(mail);
    } else {
      throw Exception("Unable to open the email");
    }
  }
}