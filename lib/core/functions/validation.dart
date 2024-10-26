import 'package:get/get.dart';


 validateInput(String val, int min, int max, String type) {
 

  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return 'Not a valid username';
    }
  } else if (type == "email") {
    if (val.isEmpty) {
      return "Email can't be empty";
    }
    if (val.length < min) {
      return "Email can't be less than $min characters";
    }
    if (val.length > max) {
      return "Email can't be more than $max characters";
    }
    if (!val.contains('@')) {
      return "Invalid email format";
    }
  } else if (type == "password") {
    if (!GetUtils.isUsername(val)) {
      return 'Not a valid password';
    }
  }

  if (val.isEmpty) {
    return "Value can't be empty";
  }
  if (val.length < min) {
    return "Can't be less than $min";
  }
  if (val.length > max) {
    return "Can't be more than $max";
  }

  return null; // Return null if validation passes
}
