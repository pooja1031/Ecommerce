import 'package:flutter/material.dart';
import 'package:freshmart/bloc.dart';
import 'package:freshmart/cart.dart';
import 'package:freshmart/model.dart';
import 'package:freshmart/veg.dart';

class VegetableScreen extends StatelessWidget {
  final CartBloc _cartBloc = CartBloc();
  final List<Product> vegetables = getVegetables();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetable Store'),
      ),
      body: ListView.builder(
        itemCount: vegetables.length,
        itemBuilder: (context, index) {
          final product = vegetables[index];
          return ListTile(
            leading: Image.asset(
              product.image,
              width: 50,
              height: 50,
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(
                      cartBloc: _cartBloc, 
                      product: product, 
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
