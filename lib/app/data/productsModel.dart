// product_model.dart
class Product {
  final String imageUrl;
  final String name;
  final double price;
  bool isFavorite;
  bool inCart;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.isFavorite = false,
    this.inCart = false,
  });
}
