import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomButtonView extends GetView {
  const CustomButtonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomButtonView'),
        centerTitle: true,
      ),
      body:
         Container(
         height: 45,
         margin: EdgeInsets.only(bottom: 30,),
         child: MaterialButton(
           onPressed: (){
             controller.next();
           },
         child: Text('continue'),
         //color: ColorApp.primaryColor,
         padding: EdgeInsets.symmetric(horizontal: 100),
         textColor: Colors.white,
         
         ),
       ));
    
  }
}
