import 'package:e_commerce_task5/app/modules/home/views/home_view.dart';
import 'package:e_commerce_task5/app/modules/login/views/login_view.dart';
import 'package:e_commerce_task5/app/modules/signup/views/signup_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final storage = GetStorage();

  // This function allows us to inject a custom navigation function for testing.
  void Function(Type)? navigate =
      (Type screenType) => Get.offAll(() => screenType);

  // Keys for stored data
  final String onboardedKey = 'hasOnboarded';
  final String loggedInKey = 'isLoggedIn';
  final String signedUpKey = 'isSignedUp';

  // Complete Onboarding
  void completeOnboarding() {
    storage.write(onboardedKey, true);
    navigate?.call(LoginView);
  }

  void checkLoginStatus() {
    bool isLoggedIn = storage.read(loggedInKey) ?? false;
    if (isLoggedIn) {
      navigate?.call(HomeView);
    } else {
      navigate?.call(LoginView);
    }
  }

  // Login User
  void login(String password) {
    storage.write(loggedInKey, true);
    navigate?.call(HomeView);
  }

  // Logout
  void logout() {
    storage.write(loggedInKey, false);
    navigate?.call(LoginView);
  }

  // Signup User
  void signup(String password) {
    storage.write(signedUpKey, true);
    navigate?.call(HomeView);
  }

  void checkAuthStatus() {
    bool isSignedUp = storage.read(signedUpKey) ?? false;
    bool isLoggedIn = storage.read(loggedInKey) ?? false;
    if (isLoggedIn) {
      navigate?.call(HomeView);
    } else if (isSignedUp) {
      navigate?.call(LoginView);
    } else {
      navigate?.call(SignupView);
    }
  }

  void resetProgress() {
    storage.remove(onboardedKey);
    storage.remove(signedUpKey);
    storage.remove(loggedInKey);
  }
}
