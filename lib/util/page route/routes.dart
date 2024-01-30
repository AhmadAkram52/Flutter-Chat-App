import 'package:a_chat/features/authentication/screens/login/login_screen.dart';
import 'package:a_chat/features/authentication/screens/splash/splash_screen.dart';
import 'package:a_chat/features/chat/screens/home/home_screen.dart';
import 'package:a_chat/features/chat/screens/profile/profile_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> pageRoutes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: '/profile',
      page: () => const ProfileScreen(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  ];
}
