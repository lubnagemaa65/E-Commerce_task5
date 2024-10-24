import 'package:get/get.dart';

import 'package:e_commerce_task5/app/modules/onBoarding/controllers/customon_boarding_controller.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<OnBoardingController>(
      () => OnBoardingControllerImp(),
    );
  }
}
