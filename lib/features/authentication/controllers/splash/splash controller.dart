import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool startAnimate = false.obs;

  startAnimation() {
    startAnimate.value = true;
  }

  goToLogin() {
    Get.offAllNamed('/login');
  }
}
