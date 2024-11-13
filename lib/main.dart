import 'package:e_commerce_task5/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:e_commerce_task5/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
 // Check login status on app start
  runApp(
    GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: "City Center Shop",
      initialRoute: AppPages.INITIAL, // Use AuthView as the initial screen
      getPages: AppPages.routes,
    ),
    
  );
    final AuthController authController = Get.put(AuthController());
  authController.checkAuthStatus();
}
