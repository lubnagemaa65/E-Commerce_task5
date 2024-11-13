import 'package:e_commerce_task5/app/data/static.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


abstract class OnBoardingController extends GetxController {
  next(); //to swip between onboarding pages
  onPageChanged(int index);
   getColorForIndex(int index);
    bool isLastPage();
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  final GetStorage storage = GetStorage();
  final String onboardedKey = 'hasOnboarded';
  OnBoardingControllerImp();

  @override
   next() {
    if (isLastPage()) {
      // Set onboarding as completed
      storage.write(onboardedKey, true);

      // Navigate to the login page
      Get.offAllNamed('/login');
    } else {
      // Increment the page index and animate to the next page
      currentPage++;
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
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

    // Check if onboarding has been completed
    if (storage.read(onboardedKey) == true) {
      // If completed, go directly to the login page
      Get.offAllNamed('/login');
    }

    super.onInit();
  }
  
  @override
  bool isLastPage() {
    return currentPage == onBoardingList.length - 1;
    

  }
}
