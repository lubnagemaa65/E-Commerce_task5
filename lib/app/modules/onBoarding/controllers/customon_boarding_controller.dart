import 'package:e_commerce_task5/app/data/static.dart';
import 'package:e_commerce_task5/app/modules/onBoarding/controllers/on_boarding_controller.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotController extends StatelessWidget {
  const CustomDotController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                    margin: EdgeInsets.only(
                      right: 5,
                    ),
                    duration: const Duration(milliseconds: 900),
                    width: controller.currentPage == index ? 20 : 5,
                    height: 6,
                    decoration: BoxDecoration(
                      color: ColorApp.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ));
  }
}
