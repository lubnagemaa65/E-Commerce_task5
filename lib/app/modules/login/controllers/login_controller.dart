import 'package:e_commerce_task5/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_commerce_task5/app/routes/app_pages.dart';
import 'package:e_commerce_task5/core/classes/statusRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void login();
  void goToSignUp();
  void goToForgetPassword();
  void showPassword();
}

class LoginControllerImp extends LoginController {
     final nameController = Get.find<TextEditingController>();
  final emailController =
      Get.find<TextEditingController>();
  final passwordController =
      Get.find<TextEditingController>();

  // Access other controllers
  final authController = Get.find<AuthController>();
  final LoginController = Get.find<LoginControllerImp>();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];

  @override
  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void login() async {
     if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      // Add your login logic here
    } 
    //else {
      // Handle invalid form state
   // }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void goToForgetPassword() {
    Get.toNamed('/forgetPassword');
  }

  @override
  void goToSignUp() {
    Get.toNamed('/signup');
  }
}
