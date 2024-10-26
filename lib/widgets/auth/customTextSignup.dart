import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextSignUp extends StatelessWidget {
  final String textOne;
  final String textTow;
  final void Function() onTap;

  const CustomTextSignUp({
    Key? key,
    required this.textOne,
    required this.textTow,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne),
        InkWell(
          onTap: onTap,
          child: Text(textTow,
              style: TextStyle(
                  color: ColorApp.primaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
