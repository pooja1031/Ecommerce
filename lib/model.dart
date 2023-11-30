// Product model
class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product({required this.id, required this.name, required this.price, required this.image});
}

// Cart item model
// Cart item model
class CartItem {
  final Product product;
  int quantity; 

  CartItem({required this.product, required this.quantity});
}

