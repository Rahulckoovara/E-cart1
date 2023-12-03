import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/model/my_product.dart';
import 'package:e_cart1/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





class Cart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
      double totalAmount = cartItems.fold(
        0, (sum, cartItem) => sum + (cartItem.price * cartItem.quantity));

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
           final Product product = MyProducts.allProducts
              .firstWhere((product) => product.id == cartItem.id );


          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
              background: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            child: Card(
              child: ListTile(
                leading: Image.asset(product.image),
                title: Text(cartItems[index].name),
               subtitle: 
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price: \₹${cartItems[index].price.toString()}',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text('Quantity: ${cartItems[index].quantity.toString()}'),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
              Text('Total: \₹${(cartItems[index].price * cartItems[index].quantity).toString()}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // Text('Total: \₹${(cartItems[index].price * cartItems[index].quantity).toString()}',
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              
              
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // Call a function to decrement the quantity in the cart
                      cartProvider.decrementQuantity(cartItem.id);
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text(' ${cartItems[index].quantity.toString()} '),
                  IconButton(
                    onPressed: () {
                      // Call a function to increment the quantity in the cart
                      cartProvider.incrementQuantity(cartItem.id);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
                      ],
                    ),
              
              
              
                  ],
                ),
                // Add more details or customize as needed
              ),
            ),
          );
  
          
          
        },
      ),




       bottomSheet: BottomAppBar(
        color: Colors.blue[300],
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //  crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total: \₹${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              //
             
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.check_outlined),
                label: Text('Place order'),
              ),
            ],
          ),
        ),
      ),  
      
  

  );
  }
}