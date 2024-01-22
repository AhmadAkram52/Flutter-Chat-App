import 'package:a_chat/util/page%20route/routes.dart';
import 'package:a_chat/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AChatApp extends StatelessWidget {
  const AChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ATheme.lightTheme,
      darkTheme: ATheme.darkTheme,
      title: "A Chat",
      initialRoute: '/',
      getPages: Routes.pageRoutes,
    );
  }
}
