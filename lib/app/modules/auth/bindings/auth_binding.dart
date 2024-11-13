import 'package:e_commerce_task5/app/modules/onBoarding/controllers/on_boarding_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController()
    );
     
  }
}
