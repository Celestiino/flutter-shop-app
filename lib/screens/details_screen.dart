import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class DetailProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final idProduct = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(idProduct);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(children: [
        Image.network(loadedProduct.imgUrl),
        Text(loadedProduct.price.toString())
      ]),
    );
  }
}
