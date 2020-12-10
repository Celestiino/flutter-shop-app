import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/badge.dart';
import '../widgets/product_grid.dart';
import '../providers/product_provider.dart';
import '../providers/cart.dart';

enum FilteredOption { All, Favorite }

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop App"),
        actions: [
          PopupMenuButton(onSelected: (FilteredOption selectedValue) {
            selectedValue == FilteredOption.All
                ? Provider.of<Products>(context, listen: false).showAll()
                : Provider.of<Products>(context, listen: false)
                    .showOnlyFavorite();
          }, itemBuilder: (_) {
            return [
              PopupMenuItem(
                child: Text("Show all"),
                value: FilteredOption.All,
              ),
              PopupMenuItem(
                child: Text("Only Favorites"),
                value: FilteredOption.Favorite,
              )
            ];
          }),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Badge(
                color: Colors.red,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
                value: cart.count.toString(),
              );
            },
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
