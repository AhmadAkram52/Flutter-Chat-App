import 'package:a_chat/features/authentication/screens/login/login_screen.dart';
import 'package:a_chat/features/chat/screens/home.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> pageRoutes = [
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/', page: () => const LoginScreen()),
  ];
}
