import 'package:e_commerce_task5/app/data/static.dart';
import 'package:e_commerce_task5/app/modules/onBoarding/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (Context, i) => Column(
        children: [
          Text(onBoardingList[i].title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              )),
          SizedBox(
            height: 80,
          ),
          Image.asset(
            onBoardingList[i].image,
            // width: 200,
            height: Get.width / 1.1,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}

