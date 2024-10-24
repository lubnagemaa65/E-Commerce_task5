import 'package:e_commerce_task5/app/data/static.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart'; // Import the Liquid Swipe package
import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
         pages: onBoardingList.asMap().entries.map((entry) {
          final index = entry.key;
          final onBoardingItem = entry.value;

          return Container(
            color:_getColorForIndex(index), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        onBoardingItem.image,
                        fit: BoxFit.contain,
                        height: 200, // Adjust height as needed
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
                // Expanded(
                //   flex: 2,
                //   child: Column(
                //     children: const [
                //       Spacer(),
                //       CustomButtonView(),
                //     ],
                //   ),
                // ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

 Color _getColorForIndex(int index) {
    // Define your color logic here based on the index
    // For example, you can return different colors based on the index
    // This is just a sample logic, you can customize it as needed
    if (index  == 0) {
      return ColorApp.primaryColor;
    } else
    if(index==1) {
      return ColorApp.secondColor;
    }
    else{
      return ColorApp.thirdColor;
    }
  }

}