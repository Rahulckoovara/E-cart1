import 'dart:io';

import 'package:e_cart1/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
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

    Future<void> generatePDF() async {
      final pdfLib.Document pdf = pdfLib.Document();

      pdf.addPage(
        pdfLib.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (context) => [
            pdfLib.Header(level: 1, text: 'Order Summary'),
            for (var cartItem in cartItems)
              pdfLib.Container(
                margin: pdfLib.EdgeInsets.all(10),
                child: pdfLib.Column(
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Text('Product: ${cartItem.name}'),
                    pdfLib.Text('Quantity: ${cartItem.quantity}'),
                    pdfLib.Text('Total: ₹${cartItem.price * cartItem.quantity}'),
                  ],
                ),
              ),
            pdfLib.Container(
              margin: pdfLib.EdgeInsets.all(10),
              child: pdfLib.Text('Total Amount: ₹${totalAmount.toStringAsFixed(2)}'),
            ),
          ],
        ),
      );

      // Save the PDF to a file
      final Directory tempDir = await getTemporaryDirectory();
      final String filePath = '${tempDir.path}/order_summary.pdf';
      final File file = File(filePath);
      await file.writeAsBytes(await pdf.save());
      print('PDF generated and saved at: $filePath');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Place Order',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),



      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row Container above Order Summary Column
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        radius: 20,
                        child: Icon(Icons.done),
                      ),
                      Text('Details')
                    ],
                  ),
                  Container(
                    height: 1,
                    width: 70,
                    color: Colors.black,
                  ),
                   Column(
                     children: [
                       CircleAvatar(
                         backgroundColor: Colors.blue[100],
                        radius: 20,
                        child:Text('2'),
                                         ),
                                          Text('Order Summary')

                     ],
                   ),
                  Container(
                    height: 1,
                    width: 70,
                    color: Colors.black,
                  ),
                   Column(
                     children: [
                       CircleAvatar(
                         backgroundColor: Colors.blue[100],
                        radius: 20,
                       child: Text('3'),
                                         ),
                                          Text('Payment')
                     ],
                   ),
                  // Container(
                  //   // Customize the container properties as needed
                  //   height: 50,
                  //   width: 350,
                  //   color: const Color.fromARGB(255, 233, 234, 235),
                  //   child: Center(
                  //     child: Text(
                  //       'Your Custom Content',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 16),
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
                      trailing: Text(
                        '\₹${cartItem.price * cartItem.quantity}',
                        style: TextStyle(color: Colors.green),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        color: Colors.blue[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total \₹${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                generatePDF();
                // Perform the logic for placing the order
                // For example, clear the cart or make an API call
                // cartProvider.clearCart(); // assuming you have a method to clear the cart
                // Navigator.pop(context); // Go back to the previous screen after placing the order
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
}
