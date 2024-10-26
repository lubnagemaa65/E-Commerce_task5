import 'package:e_commerce_task5/app/modules/login/controllers/login_controller.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:e_commerce_task5/core/classes/handlingDataView.dart';
import 'package:e_commerce_task5/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_task5/widgets/auth/customTextBody.dart';
import 'package:e_commerce_task5/widgets/auth/customTextFormField.dart';
import 'package:e_commerce_task5/widgets/auth/customTextSignup.dart';
import 'package:e_commerce_task5/widgets/auth/customTextTitle.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginView extends GetView<LoginControllerImp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginControllerImp controller = Get.find();

  LoginView({Key? key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.primaryColor,
        elevation: 0.0,
        title: Text('Login',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: ColorApp.grey)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandelingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const CustomTextTitle(text: "Welcome To City Center store!"),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                        text: "Login With Your Email And Password"),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains("@")) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      myController: emailController,
                      hintText: "Enter Your email",
                      iconData: Icons.email_outlined,
                      labelText: "Email",
                      isNumber: false,
                    ),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustomTextFormField(
                        isNumber: false,
                        obscureText: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Please enter a valid password (minimum 8 characters)';
                          }
                          return null;
                        },
                        myController: passwordController,
                        hintText: "Enter your password",
                        iconData: Icons.lock_outline,
                        labelText: "Password",
                      ),
                    ),
                    CustomButtonAuth(
                      text: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, you can proceed with your logic
                          Get.toNamed('/home');
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomTextSignUp(
                      textOne: "Don't have an account? ",
                      
                      onTap: () {
                        controller.goToSignUp();
                      }, textTow: "Create an Account",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
