import 'package:flutter/material.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  UserProductItem({this.title, this.imageUrl});
  final title;
  final imageUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, EditProductScreen.routeName);
                  }),
              IconButton(icon: Icon(Icons.delete), onPressed: () {})
            ],
          ),
        ));
  }
}
