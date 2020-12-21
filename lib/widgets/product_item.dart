import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Product>(
      builder: (context, product, child) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'product-details',
              arguments: product.id),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              header: GridTileBar(
                title: Text(
                  product.price.toString(),
                  style: TextStyle(
                    backgroundColor: Colors.green,
                    fontSize: 20.0,
                  ),
                ),
              ),
              child: Image.network(product.imgUrl),
              footer: GridTileBar(
                leading: IconButton(
                  icon: product.favorite
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(Icons.favorite),
                  onPressed: () {
                    product.toggleFavoriteState();
                    print(product.favorite);
                  },
                ),
                backgroundColor: Colors.black87,
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart_rounded),
                  onPressed: () {
                    Scaffold.of(context).hideCurrentSnackBar();

                    cart.addItem(
                      productId: product.id,
                      price: product.price,
                      title: product.title,
                    );
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Product add to cart",
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            cart.removeSingleProduct(product.id);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
