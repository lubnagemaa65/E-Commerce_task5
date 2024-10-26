import 'package:e_commerce_task5/app/modules/onBoarding/controllers/on_boarding_controller.dart';
import 'package:e_commerce_task5/app/modules/signup/views/signup_view.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonView extends GetView<OnBoardingController> {
  const CustomButtonView({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 30
      ),

      child: MaterialButton(
        onPressed: () {
Get.toNamed('/signup')   ;     },
        child: Text('Continue'),
        color: ColorApp.thirdColor,
        padding: EdgeInsets.symmetric(horizontal: 16),
        textColor: Colors.white,
      ),
    );
  }
}
