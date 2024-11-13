// product_cart.dart
import 'package:e_commerce_task5/app/data/productsModel.dart';
import 'package:e_commerce_task5/app/modules/home/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCart extends GetView<ProductController> {
  final Product product;
  final VoidCallback onFavoritePressed;
  final VoidCallback onAddToCartPressed;

  const ProductCart({
    Key? key,
    required this.product,
    required this.onFavoritePressed,
    required this.onAddToCartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.green),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => IconButton(
                        icon: Icon(
                          controller.favorites.contains(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: controller.favorites.contains(product)
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onPressed: onFavoritePressed,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        controller.cartItems.contains(product)
                            ? Icons.shopping_cart
                            : Icons.add_shopping_cart,
                        color: controller.cartItems.contains(product)
                            ? Colors.green
                            : Colors.grey,
                      ),
                      onPressed: onAddToCartPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
