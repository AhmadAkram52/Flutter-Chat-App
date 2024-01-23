import 'package:a_chat/features/authentication/screens/login/login_screen.dart';
import 'package:a_chat/features/authentication/screens/splash/splash_screen.dart';
import 'package:a_chat/features/chat/screens/home.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> pageRoutes = [
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/', page: () => const SplashScreen()),
  ];
}
