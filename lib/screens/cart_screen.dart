import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartScreem extends StatelessWidget {
  const CartScreem({Key key}) : super(key: key);
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Your Card")),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      cart.totalAmount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  FlatButton(onPressed: () {}, child: Text("ORDER NOW"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
