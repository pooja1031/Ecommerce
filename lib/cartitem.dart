import 'package:flutter/material.dart';
import 'package:freshmart/bloc.dart';
import 'package:freshmart/model.dart';

class CartItemsPage extends StatelessWidget {
  final CartBloc cartBloc;
  final Product addedProduct; // Define the named parameter for the added product

  CartItemsPage({
    required this.cartBloc,
    required this.addedProduct,
  });

  @override
  Widget build(BuildContext context) {
    // Use addedProduct and cartBloc as needed to display the added product in the cart items page
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Added Product:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            // Display information of the added product
            ListTile(
              leading: Image.asset(
                addedProduct.image,
                width: 50,
                height: 50,
              ),
              title: Text(addedProduct.name),
              subtitle: Text('\$${addedProduct.price.toStringAsFixed(2)}'),
            ),
            // Other cart items display or functionality here using cartBloc
          ],
        ),
      ),
    );
  }
}
