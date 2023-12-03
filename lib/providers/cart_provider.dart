import 'package:flutter/material.dart';

import '../model/Product.dart';


class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    
    _cartItems.add(product);
    notifyListeners();
  }
  void incrementQuantity(int productId) {

  // Find the cart item by product id and increment the quantity
  final cartItem = _cartItems.firstWhere((item) => item.id == productId);
  cartItem.quantity++;

  // Notify listeners to update the UI
  notifyListeners();

}
void decrementQuantity(int productId) {
  // Find the cart item by product id and increment the quantity
  final cartItem = _cartItems.firstWhere((item) => item.id == productId);
  cartItem.quantity--;
   if (cartItem.quantity == 0) {
    _cartItems.remove(cartItem);
  }
  

  // Notify listeners to update the UI
  notifyListeners();
}


}





// class CartProvider extends ChangeNotifier {
//   final List<Product> _cart = [];
//   List<Product> get cart => _cart;

// //  CartProvider({
// //     Key? key,
// //     required Widget child,
// //   }) : super(key: key, child: child);

// //   static CartProvider of(BuildContext context) {
// //     return context.dependOnInheritedWidgetOfExactType<CartProvider>()!;
// //   }

//   void toggleProduct(Product product) {
//     if (_cart.contains(product)) {
//       for (Product element in _cart) {
//         element.quantity++;
//       }
//     } else {
//       _cart.add(product);
//     }
//     notifyListeners();
//   }

//   static of(BuildContext context) {}
//   //  @override
//   // bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//   //   return true;
//   //}

