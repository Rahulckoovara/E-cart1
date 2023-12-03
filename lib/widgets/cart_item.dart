import 'package:e_cart1/model/Product.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem, required int id});
  final Product cartItem;
  @override
  Widget build(BuildContext context) {
    return Text(cartItem.name);
  }
}
