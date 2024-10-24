import 'package:e_commerce_task5/app/data/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next(); //to swip between onboarding pages
  onPageChanged(int index); //to link the dot bar with suitable page
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
