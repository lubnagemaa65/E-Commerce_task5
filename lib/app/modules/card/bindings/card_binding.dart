import 'package:e_commerce_task5/app/modules/card/controllers/card_controller.dart';
import 'package:get/get.dart';


class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
