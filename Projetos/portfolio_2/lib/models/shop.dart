import 'package:flutter/widgets.dart';
import 'package:portfolio_2/models/product.dart';

class Shop extends ChangeNotifier {
  //Products
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description: "description",
      imagePath: 'lib/images/SNKRS1.png',
    ),

    Product(
      name: "Product 2",
      price: 99.99,
      description: "description",
      imagePath: 'lib/images/SNKRS2.png',
    ),

    Product(
      name: "Product 3",
      price: 99.99,
      description: "description",
      imagePath: 'lib/images/SNKRS3.png',
    ),

    Product(
      name: "Product 3",
      price: 99.99,
      description: "description",
      imagePath: 'lib/images/SNKRS4.png',
    ),
  ];

  //Cart
  List<Product> _cart = [];

  //Get Product
  List<Product> get shop => _shop;

  //Get Cart
  List<Product> get cart => _cart;

  //Add Item To Cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //Remove Item To Cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
