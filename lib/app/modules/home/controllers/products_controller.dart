// product_controller.dart
import 'package:e_commerce_task5/app/data/productsModel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {

    var favorites = <Product>[].obs;
        var cartItems = <Product>[].obs; // List to hold favorite products
 // List to hold favorite products

  var products = <Product>[
    Product(imageUrl: 'assets/images/1.png', name: 'Mobile', price: 29.99),
    Product(imageUrl: 'assets/images/2.png', name: 'Laptop', price: 19.99),
    Product(imageUrl: 'assets/images/2.png', name: 'Lap', price: 39.99),
    Product(imageUrl: 'assets/images/1.png', name: 'Mob', price: 49.99),
    Product(imageUrl: 'assets/images/1.png', name: 'Mobile', price: 29.99),
    Product(imageUrl: 'assets/images/2.png', name: 'Laptop', price: 19.99),
    Product(imageUrl: 'assets/images/2.png', name: 'Lap', price: 39.99),
    Product(imageUrl: 'assets/images/1.png', name: 'Mob', price: 49.99),
    Product(imageUrl: 'assets/images/1.png', name: 'Mobile', price: 29.99),
    Product(imageUrl: 'assets/images/2.png', name: 'Laptop', price: 19.99),
    Product(imageUrl: 'assets/images/2.png', name: 'Lap', price: 39.99),
    Product(imageUrl: 'assets/images/1.png', name: 'Mob', price: 49.99),
    // Add more products
  ].obs;



  void addToCart(int index) {
    final product = products[index];
    if (cartItems.contains(product)) {
      cartItems.remove(product);
    } else {
      cartItems.add(product);
    }    products.refresh();
  }
  void toggleFavorite(int index) {
    final product = products[index];
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }
}

