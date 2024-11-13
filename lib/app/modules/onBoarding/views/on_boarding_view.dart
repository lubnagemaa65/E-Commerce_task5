import 'package:e_commerce_task5/app/modules/onBoarding/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';

import 'package:e_commerce_task5/app/data/static.dart';
import 'package:e_commerce_task5/app/modules/onBoarding/views/custom_button_view.dart';


class OnBoardingView extends GetView<OnBoardingController> {
  final storage=GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: onBoardingList.asMap().entries.map((entry) {
          final index = entry.key;
          final onBoardingItem = entry.value;

          return Container(
            color: controller.getColorForIndex(index),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.3,
                            width: constraints.maxWidth,
                            child: Lottie.asset(
                              onBoardingItem.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            onBoardingItem.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            onBoardingItem.body,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    if (index == 2)
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            const Spacer(),
                            CustomButtonView(storage: storage,),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
