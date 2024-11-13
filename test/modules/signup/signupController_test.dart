import 'package:e_commerce_task5/core/classes/statusRequest.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:e_commerce_task5/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_commerce_task5/app/modules/signup/controllers/signup_controller.dart';
import 'package:e_commerce_task5/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

void main() {
  // Enable GetX test mode
  Get.testMode = true;

  late GetStorage storage;

  // setUpAll(() async {
  //   // Initialize GetStorage with an in-memory instance for testing
  //   await GetStorage.init(); // You may also need to use GetStorage.init() to initialize GetStorage
  // });

  setUp(() {
    // Create a new GetStorage instance for each test
    storage = GetStorage();

    // Register the SignUpController and AuthController in GetX dependency manager
    Get.put(SignUpControllerImp(
        storage: storage)); // Pass GetStorage to the controller
    Get.put(AuthController()); // Put the AuthController in GetX
  });

  tearDown(() {
    // Dispose of the controllers after each test
    Get.delete<SignUpControllerImp>();
    Get.delete<AuthController>();
  });

  // Test 1: Test signUp method
  test('signUp should set status to loading and write to storage', () async {
    final signUpController = Get.find<SignUpControllerImp>();

    // Set up the form validation (skip actual form validation for simplicity)
    signUpController.formstate = GlobalKey<FormState>(); // Mock formstate
    signUpController.name.text = 'Test User';
    signUpController.email.text = 'test@example.com';
    signUpController.password.text = 'password123';

    // Trigger the signUp() method
    await signUpController.signUp();

    // Check if the statusRequest is loading after calling signUp
    expect(signUpController.statusRequest, StatusRequest.loading);

    // Verify if 'sign_up_completed' was written to the storage
    bool signUpCompleted = storage.read('sign_up_completed') ?? false;
    expect(signUpCompleted, true);
  });

  // Test 2: Test goToLogIn method
  test('goToLogIn should navigate to the login screen', () async {
    final signUpController = Get.find<SignUpControllerImp>();

    // Trigger the goToLogIn method
    signUpController.goToLogIn();

    // Wait for navigation to complete
    await Future.delayed(const Duration(seconds: 1));

    // Verify if the current route is '/login' after calling goToLogIn
    expect(Get.currentRoute, Routes.LOGIN);
  });

  // Test 3: Test showPassword method
  test('showPassword should toggle the password visibility', () {
    final signUpController = Get.find<SignUpControllerImp>();

    // Initially, the password visibility should be true
    expect(signUpController.isShowPassword, true);

    // Call showPassword to toggle the visibility
    signUpController.showPassword();

    // Verify if the visibility was toggled
    expect(signUpController.isShowPassword, false);

    // Call showPassword again to toggle the visibility back
    signUpController.showPassword();

    // Verify if the visibility was toggled back to true
    expect(signUpController.isShowPassword, true);
  });
}
