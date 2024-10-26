

import 'package:e_commerce_task5/app/routes/app_pages.dart';
import 'package:e_commerce_task5/core/classes/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogIn();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;

  late TextEditingController name;
    late TextEditingController email;

  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;
 // SignupData signupData = SignupData(Get.find());
  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
   
     
    }
  }

  @override
  goToLogIn() {
    Get.offNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();

  
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
  
    password.dispose();
    super.dispose();
  }
  
  @override
  showPassword() {
     isShowPassword = !isShowPassword;
    update();
  }
  
  
}
