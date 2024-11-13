import 'package:get/get.dart';

import 'package:e_commerce_task5/app/modules/home/controllers/products_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
