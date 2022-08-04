import 'package:get/get.dart';

class Controller extends GetxController {
  Map<String, List<DateTime>> sessions = {};

  void addSession(Map<String, List<DateTime>> value) => sessions = value;
}
