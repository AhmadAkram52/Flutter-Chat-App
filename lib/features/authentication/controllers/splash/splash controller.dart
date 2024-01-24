import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool startAnimate = false.obs;

  startAnimation() {
    startAnimate.value = true;
  }

  navToNext() async {
    if (AuthHelper().isUserLogin()) {
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/login');
    }
  }
}
