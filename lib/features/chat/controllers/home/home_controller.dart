import 'package:get/get.dart';

class HomeController extends GetxController {
  // static HomeController get homeCtrl => Get.find();

  void gotoProfile() {
    Get.toNamed('/profile');
  }
}
