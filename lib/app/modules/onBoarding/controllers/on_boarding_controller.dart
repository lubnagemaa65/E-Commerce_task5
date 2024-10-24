import 'package:e_commerce_task5/app/data/static.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next(); //to swip between onboarding pages
  onPageChanged(int index);
   //to link the dot bar with suitable page
   getColorForIndex(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  next() {
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(microseconds: 900), curve: Curves.easeInOut);

    if (currentPage > onBoardingList.length - 1) {
     
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }
Color getColorForIndex(int index) {
    // Define your color logic here based on the index
    // For example, you can return different colors based on the index
    // This is just a sample logic, you can customize it as needed
    if (index == 0) {
      return ColorApp.primaryColor;
    } else if (index == 1) {
      return ColorApp.secondColor;
    } else {
      return ColorApp.thirdColor;
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
