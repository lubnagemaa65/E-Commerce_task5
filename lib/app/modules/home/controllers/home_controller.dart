
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
final selectedTabIndex = 0.obs;

  HomeController() : super();

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }
}