import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CustomCartItem extends StatelessWidget {
  CustomCartItem(
      {this.price, this.id, this.productId, this.title, this.quantity});
  final price;
  final quantity;
  final title;
  final productId;
  final id;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItems(productId);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Text("\$$price"),
            ),
          ),
          title: Text(title ?? "Nullo"),
          subtitle: Text("Total: \$${(price * quantity)}"),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
