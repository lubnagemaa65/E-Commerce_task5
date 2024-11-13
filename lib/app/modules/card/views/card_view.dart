import 'package:e_commerce_task5/app/modules/home/controllers/products_controller.dart';
import 'package:e_commerce_task5/widgets/auth/productCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (productController.favorites.isEmpty) {
          return Center(child: Text("Empty Basket!"));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
          ),
          itemCount: productController.favorites.length,
          itemBuilder: (context, index) {
            final product = productController.cartItems[index];
            return ProductCart(
              product: product,
              onFavoritePressed: () => productController.toggleFavorite(index),
              onAddToCartPressed: () => productController.addToCart(index),
            );
          },
        );
      }),
    );
  }
}
