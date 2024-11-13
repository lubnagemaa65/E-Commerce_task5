import 'package:e_commerce_task5/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginControllerImp>(
      () => LoginControllerImp(),
    );
          Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<LoginControllerImp>(() => LoginControllerImp());

    // Bind TextEditingController instances
    Get.put<TextEditingController>(TextEditingController(),
        tag: 'emailController');
    Get.put<TextEditingController>(TextEditingController(),
        tag: 'passwordController');
    Get.put<TextEditingController>(TextEditingController(),
        tag: 'nameController');
  }
}
