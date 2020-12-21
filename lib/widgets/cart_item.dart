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
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Tem Certeza?"),
                  content: Text('Que deseja excluir o produto?,'),
                  actions: [
                    FlatButton(
                      child: Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text('Sim'),
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .removeItems(id);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              },
            );
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
