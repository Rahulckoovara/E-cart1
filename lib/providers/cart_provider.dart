import 'package:flutter/material.dart';

import '../model/Product.dart';


class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    bool alreadyInCart = _cartItems.any((item) => item.id == product.id);
    

    if(!alreadyInCart){
      _cartItems.add(product);
      notifyListeners();
    
  }
     else{
    notifyListeners();
//Navigator.push(context, MaterialPageRoute(builder: (context)))

 //   Navigator.pushReplacement(context, '/cart1');
     }
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




