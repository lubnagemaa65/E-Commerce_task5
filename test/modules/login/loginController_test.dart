import 'package:e_commerce_task5/app/routes/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:e_commerce_task5/app/modules/login/controllers/login_controller.dart';

void main() {
  // Enable test mode for GetX to prevent actual route changes
  Get.testMode = true;

  setUp(() {
    // Register LoginControllerImp with GetX before each test
    Get.put<LoginControllerImp>(LoginControllerImp());
  });

  tearDown(() {
    // Reset GetX after each test to clean up registered dependencies
    Get.reset();
  });

  test('goToSignUp should navigate to SIGNUP route', () {
    // Retrieve the existing LoginControllerImp instance
    final loginController = Get.find<LoginControllerImp>();

    // Trigger the navigation to Sign Up
    loginController.goToSignUp();

    // Check that the expected route is '/signup' using Get.routing.current
    expect(Get.routing.current, Routes.SIGNUP);
  });
}
