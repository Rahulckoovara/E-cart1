import 'package:e_cart1/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:e_cart1/model/my_product.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final Product cartItem;
  @override
  Widget build(BuildContext context) {
    return Text(cartItem.name);
  }
}
