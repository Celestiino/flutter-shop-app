import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
  ];
  bool _showFavorite = false;
  bool _showAll = true;
  List<Product> get items {
    if (_showAll) {
      return [..._items];
    } else {
      return _items.where((prod) => prod.favorite == true).toList();
    }
  }

  void showOnlyFavorite() {
    _showFavorite = true;
    _showAll = false;
    notifyListeners();
  }

  void showAll() {
    _showFavorite = false;
    _showAll = true;
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct() {
    // _items.add();
    notifyListeners();
  }
}
