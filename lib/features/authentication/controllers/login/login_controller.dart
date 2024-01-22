import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isAnimation = false.obs;

  statAnimation() {
    isAnimation.value = true;
  }
}
