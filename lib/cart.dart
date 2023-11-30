// cart_screen.dart
import 'package:flutter/material.dart';
import 'package:freshmart/bloc.dart';
import 'package:freshmart/cartitem.dart';
import 'package:freshmart/model.dart';

class CartScreen extends StatefulWidget {
  final CartBloc _cartBloc = CartBloc();
  final CartBloc cartBloc; // Accept CartBloc instance
  final Product product;

  CartScreen({
    required this.cartBloc,
    required this.product,
  });

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 1; // Initial quantity

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.product.image,
            width: 150,
            height: 150,
          ),
          SizedBox(height: 20),
          Text(
            widget.product.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '\$${widget.product.price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_quantity > 1) {
                      _quantity--;
                    }
                  });
                },
                icon: Icon(Icons.remove),
              ),
              Text(
                '$_quantity',
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
        onPressed: () {
          for (int i = 0; i < _quantity; i++) {
            widget.cartBloc.addToCart(widget.product);
          }
          // Navigate to the CartItemsPage and pass the added product and CartBloc instance
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartItemsPage(
                cartBloc: widget.cartBloc,
                addedProduct: widget.product, // Pass the added product
              ),
            ),
          );
        },
        child: Text('Add $_quantity to Cart'),
      ),
   ] )
      );
    
  }
}
