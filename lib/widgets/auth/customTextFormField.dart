// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  final bool isNumber;
  final bool? obscureText;
  void Function()? onTapIcon;
  CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    this.onTapIcon,
    required this.myController,
    this.validator,
    required this.isNumber,
    this.obscureText, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 25,
      ),
      child: TextFormField(
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: validator,
        obscureText: obscureText == null || obscureText == false ? false : true,
        controller: myController,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30.0),
            label: Text(labelText),
            suffixIcon: InkWell(
              child: Icon(iconData),
              onTap: onTapIcon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
      ),
    );
  }
}
