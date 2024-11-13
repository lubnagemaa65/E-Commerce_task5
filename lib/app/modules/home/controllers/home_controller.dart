import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  final selectedTabIndex = 0.obs;
  late AnimationController
      aniController; // Define aniController as a late field

  @override
  void onInit() {
    super.onInit();
  
  }



  // Function to change the tab index
  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }
}
