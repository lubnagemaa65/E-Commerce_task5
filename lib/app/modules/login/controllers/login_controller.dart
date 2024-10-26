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
    Get.toNamed(Routes.FORGETPASSWORD);
  }

  @override
  void goToSignUp() {
    Get.offNamed(Routes.SIGNUP);
  }
}
