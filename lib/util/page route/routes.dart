import 'package:a_chat/features/authentication/screens/login_screen.dart';
import 'package:a_chat/features/chat/screens/home.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> pageRoutes = [
    GetPage(name: '/', page: () => const HomeScreen()),
    GetPage(name: '/login', page: () => const LoginScreen()),
  ];
}
