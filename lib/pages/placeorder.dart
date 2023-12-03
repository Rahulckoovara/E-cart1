import 'package:e_cart1/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

      double totalAmount = 0;
    for (var cartItem in cartItems) {
      totalAmount += cartItem.price * cartItem.quantity;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Order',
        style: TextStyle(color: Colors.white)
        ),
        centerTitle: true,

        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  // Assuming you have a Product model with a 'name' property
                  return ListTile(
                    title: Text(cartItem.name),
                    subtitle: Text('Quantity: ${cartItem.quantity}'),
                    trailing: Text('\₹${cartItem.price * cartItem.quantity}'),
                  );
                },
              ),
            ),
          
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        color: Colors.blue[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             // SizedBox(height: 16),
           Text(
              'Total \₹${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
            ),

            ElevatedButton(
              onPressed: () {
                // Perform the logic for placing the order
                // For example, clear the cart or make an API call
              //  cartProvider.clearCart(); // assuming you have a method to clear the cart
               // Navigator.pop(context); // Go back to the previous screen after placing the order
              },
               child: Text('Confirm Order'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
