import 'package:e_commerce_task5/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    // Bind AuthController and SignUpController
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SignUpControllerImp>(() => SignUpControllerImp());

    // Bind TextEditingController instances
    Get.put<TextEditingController>(TextEditingController(),
        tag: 'emailController');
    Get.put<TextEditingController>(TextEditingController(),
        tag: 'passwordController');
    Get.put<TextEditingController>(TextEditingController(),
        tag: 'nameController');
  }
}
