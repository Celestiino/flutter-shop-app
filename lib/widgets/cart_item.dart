import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../providers/cart.dart';

class CustomCartItem extends StatelessWidget {
  CustomCartItem({this.price, @required this.id, this.title, this.quantity});
  final price;
  final quantity;
  final title;
  final id;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      actions: [
        IconSlideAction(
          caption: 'Remove Item',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            Provider.of<Cart>(context, listen: false).removeItems(id);
            print("Removido");
          },
        ),
      ],
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
