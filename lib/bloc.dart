import 'dart:async';
import 'package:freshmart/model.dart';

class CartBloc {
  final _cartStreamController = StreamController<List<CartItem>>.broadcast();
  List<CartItem> _cart = [];

  Stream<List<CartItem>> get cartStream => _cartStreamController.stream;

  List<CartItem> get cart => _cart;

  void addToCart(Product product) {
    final cartItem = _cart.firstWhere((item) => item.product.id == product.id, orElse: () => CartItem(product: product, quantity: 0));
    if (cartItem.quantity > 0) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(product: product, quantity: 1));
    }
    _cartStreamController.sink.add(_cart);
  }

  void dispose() {
    _cartStreamController.close();
  }
}
