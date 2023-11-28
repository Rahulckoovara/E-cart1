import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/pages/availablesize.dart';
import 'package:e_cart1/pages/cart.dart';
import 'package:e_cart1/providers/cart_provider.dart';
import 'package:flutter/material.dart';
// import '../providers/cart_provider.dart';

class Details extends StatelessWidget {
  //final String size;
  final Product product;
  const Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    //final finalList = provider.cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 400,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        shape: BoxShape.rectangle,
                        color: Color.fromARGB(255, 214, 220, 224)),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.contain,
                        ))),
              ],
            ),
            const SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(7),
                width: double.infinity,
                height: 420,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 238, 238),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name.toUpperCase(),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '₹' '${product.price.toString()}',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(product.description)
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Available size',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Availablesize(size: 'US 6'),
                          Availablesize(size: 'US 7'),
                          Availablesize(size: 'US 8'),
                          Availablesize(size: 'US 9'),
                        ],
                      )
                    ],
                  ),
                ))
          ]),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
              color: Colors.blue[400],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹' ' ${product.price}',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    provider.toggleProduct(product);
                  },
                  icon: Icon(Icons.send),
                  label: Text('Add To Cart'))
            ],
          ),
        ),
      ),
    );
  }
}
