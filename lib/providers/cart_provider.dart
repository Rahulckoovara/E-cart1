import 'package:flutter/material.dart';
import '../model/Product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

//  CartProvider({
//     Key? key,
//     required Widget child,
//   }) : super(key: key, child: child);

//   static CartProvider of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<CartProvider>()!;
//   }

  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  static of(BuildContext context) {}
  //  @override
  // bool updateShouldNotify(covariant InheritedWidget oldWidget) {
  //   return true;
  //}
}
