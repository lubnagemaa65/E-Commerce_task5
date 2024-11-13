import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:e_commerce_task5/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_commerce_task5/app/modules/onBoarding/controllers/on_boarding_controller.dart';
import 'package:e_commerce_task5/constants/appColors.dart';

class CustomButtonView extends GetView<OnBoardingController> {
  final AuthController authController = Get.put(AuthController());
GetStorage storage;
  CustomButtonView({
    required this.storage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 30
      ),

      child: MaterialButton(
        
        onPressed: () {
            if (controller.isLastPage()) {
            GetStorage.init();
            // Mark onboarding as complete
            storage.write('hasOnboarded', true);
            authController.completeOnboarding();

            // Navigate to login view
            Get.offAllNamed('/login');
          }

    },
        child: Text('Continue'),
        color: ColorApp.thirdColor,
        padding: EdgeInsets.symmetric(horizontal: 16),
        textColor: Colors.white,
      ),
    );
  }
}
