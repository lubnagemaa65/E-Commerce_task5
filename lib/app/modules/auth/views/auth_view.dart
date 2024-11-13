import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:e_commerce_task5/app/modules/onBoarding/views/on_boarding_view.dart';
import 'package:e_commerce_task5/app/modules/home/views/home_view.dart';
import 'package:e_commerce_task5/app/modules/login/views/login_view.dart';
import 'package:e_commerce_task5/app/modules/onBoarding/controllers/on_boarding_controller.dart';

class AuthView extends GetView {
  final GetStorage storage = GetStorage();
  AuthView() {
    // Initialize OnBoardingController only if onboarding has not been completed
    if (storage.read('hasOnboarded') != true) {
controller.completeOnboarding;    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasOnboarded =
        storage.read('hasOnboarded') == true; // Explicit check for boolean
    bool isLoggedIn =
        storage.read('isLoggedIn') == true; // Explicit check for boolean

    // Navigate to the appropriate initial screen based on storage flags
    if (isLoggedIn) {
      return HomeView();
    } else if (hasOnboarded) {
      return LoginView();
    } else {
      return OnBoardingView(); // Dependencies should be loaded now
    }
  }
}
