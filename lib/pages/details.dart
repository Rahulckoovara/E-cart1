import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/pages/availablesize.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  //final String size;
  final Product product;
  const Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
            ]));
  }
}
