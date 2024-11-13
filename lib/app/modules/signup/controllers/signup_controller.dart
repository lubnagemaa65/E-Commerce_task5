

import 'package:e_commerce_task5/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_commerce_task5/core/classes/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogIn();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;
   final GetStorage? storage; // Add storage dependency

  late TextEditingController name;
    late TextEditingController email;

  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;
 // SignupData signupData = SignupData(Get.find());
  List data = [];
    AuthController authController = Get.put(AuthController());
  SignUpControllerImp({GetStorage? storage})
      : storage = storage ?? GetStorage();

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
   storage?.write('sign_up_completed', true);
           authController.signup(password.text);

    }
  }

  @override
  goToLogIn() {
    Get.toNamed('/login');
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
