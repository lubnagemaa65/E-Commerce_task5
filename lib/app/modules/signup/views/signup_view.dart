import 'package:e_commerce_task5/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:e_commerce_task5/core/classes/handlingDataView.dart';
import 'package:e_commerce_task5/widgets/auth/customButtonAuth.dart';
import 'package:e_commerce_task5/widgets/auth/customTextBody.dart';
import 'package:e_commerce_task5/widgets/auth/customTextFormField.dart';
import 'package:e_commerce_task5/widgets/auth/customTextSignup.dart';
import 'package:e_commerce_task5/widgets/auth/customTextTitle.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  // final authController = Get.find<AuthController>();
  // final signUpController = Get.find<SignUpControllerImp>();
  SignupView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.primaryColor,
        elevation: 0.0,
        title: Text(
          'Sign Up',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: ColorApp.grey),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandelingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const CustomTextTitle(text: "Welcome Back"),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                      text: "Sign Up With Your Email And Password",
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                      myController: nameController,
                      hintText: "Enter Your Name",
                      iconData: Icons.person_outline,
                      labelText: "Name",
                      isNumber: false,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains("@")) {
                          return 'Please enter a correct email';
                        }
                        return null;
                      },
                      myController: emailController,
                      hintText: "Enter Your Email",
                      iconData: Icons.email_outlined,
                      labelText: "Email",
                      isNumber: false,
                    ),
                    CustomTextFormField(
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
                    CustomButtonAuth(
                        text: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller
                                .signUp(); // Use SignUpControllerImp to handle signup
                          }
                        }),
                    const SizedBox(height: 40),
                    CustomTextSignUp(
                      textOne: "Have an account? ",
                      textTow: "Login",
                      onTap: () {
                        controller.goToLogIn();
                      },
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
