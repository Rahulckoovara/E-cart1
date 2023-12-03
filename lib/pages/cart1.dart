import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/model/my_product.dart';
import 'package:e_cart1/pages/placeorder.dart';
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
        title: Text('Cart',
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
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
                leading: Container(
                  width: 80,
                  child: Image.asset(product.image)),
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
                        Row(
                          children: [
                            Text('Total: \₹${(cartItems[index].price * cartItems[index].quantity).toString()}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            
                            
                                          ),
                                          
                          ],
                        ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue[300], // Set your desired color
                                borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // Call a function to decrement the quantity in the cart
                                  cartProvider.decrementQuantity(cartItem.id);
                                },
                                icon: Icon(Icons.remove,size: 13,),
                                color: Colors.white, // Optional: Set the icon color
                              ),
                            ),
                            SizedBox(width: 8.0), // Add some space between the icons and text
                            Container(
                              
                              color: Colors.grey[200],
                              // decoration: BoxDecoration(
                              //   border: Border.all()
                              // ),


                              child: Text(
                                ' ${cartItems[index].quantity.toString()} ',
                                style: TextStyle(fontSize: 13.0), // Optional: Adjust the font size
                              ),
                            ),
                            SizedBox(width: 8.0), // Add some space between the text and icons
                            Container(
                                height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue[300], // Set your desired color
                                borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // Call a function to increment the quantity in the cart
                                  cartProvider.incrementQuantity(cartItem.id);
                                },
                                icon: Icon(Icons.add,size: 13,),
                                color: Colors.white, // Optional: Set the icon color
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    

                    // TextButton.icon(onPressed: (){
                    //  //cartProvider.cartItems.remove(cartItem);
                    // }, 
                    //  label: Text('Remove',style: TextStyle(color: Colors.black,
                    //  fontWeight: FontWeight.w400),
                    //  ),
                    // icon: Icon(Icons.delete,color: Colors.black,), 
                    //  )
                  
              
              
              
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PlaceOrderPage();
                  }));                },
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