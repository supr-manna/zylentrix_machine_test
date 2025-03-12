import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/route/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      initialRoute: RouteHelper.postScreen,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: RouteHelper.route,
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
    );
  }
}
