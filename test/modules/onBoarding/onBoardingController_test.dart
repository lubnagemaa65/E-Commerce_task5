import 'package:e_commerce_task5/app/data/static.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:e_commerce_task5/app/modules/onBoarding/controllers/on_boarding_controller.dart';

void main() {
  late OnBoardingControllerImp controller;
  late GetStorage storage;



  setUp(() {
    // Create a new GetStorage instance for each test
    storage = GetStorage();
    // Initialize controller and pass GetStorage to it
    controller = OnBoardingControllerImp();
    Get.put(controller); // Bind the controller
  });

  tearDown(() async {
    // Clear the storage after each test to ensure a clean state
    await storage.erase();
    Get.reset(); // Reset Get bindings after each test
  });

  test(
      'should mark onboarding as completed and navigate to login page on last page',
      () async {
    // Simulate reaching the last page
    controller.currentPage = onBoardingList.length - 1;

    // Call next() to mark the onboarding as complete and navigate to login
    controller.next();

    // Verify that the onboarding completion is saved in storage
    expect(storage.read('hasOnboarded'), true);
    // Verify that navigation happened to the login page
    expect(Get.currentRoute, '/login');
  });

  test('should increment page index when next() is called and not on last page',
      () async {
    // Set current page to 0 (not the last page)
    controller.currentPage = 0;
    controller.next(); // Call next() to move to the next page

    // Verify that the current page index is incremented
    expect(controller.currentPage, 1);
    // Verify that onboarding is not yet completed
    expect(storage.read('hasOnboarded'), null);
  });

  test('should set the color based on page index', () {
    // Test color changes based on the page index
    expect(controller.getColorForIndex(0), ColorApp.primaryColor);
    expect(controller.getColorForIndex(1), ColorApp.secondColor);
    expect(controller.getColorForIndex(2), ColorApp.thirdColor);
  });
}
