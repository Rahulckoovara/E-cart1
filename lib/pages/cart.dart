//import '../model/Product.dart';
import 'package:e_cart1/model/my_product.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  //final Product product;
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {

    
    final cartItems = MyProducts.allProducts.take(5).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 16, top: 10),
        children: [
          ...List.generate(cartItems.length, (index) {
            return Dismissible(
              key: UniqueKey(),
              
              child: SizedBox(
                  height: 125,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0.1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(
                              width: 0.3, color: Colors.grey.shade400)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              height: double.infinity,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(cartItems[index].image))),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${cartItems[index].name}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '₹' + cartItems[index].price.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 110,
                                    ),
                                    ToggleButtons(
                                      borderRadius: BorderRadius.circular(90),
                                      children: [
                                        Icon(
                                          Icons.remove,
                                          size: 25,
                                        ),
                                        Container(
                                          width: 20,
                                          child: Text(
                                            '2',
                                          ),
                                        ),
                                        Icon(
                                          Icons.add,
                                          size: 30,
                                        )
                                      ],
                                      isSelected: [true, false, true],
                                      selectedColor: Colors.blue,
                                      constraints: BoxConstraints(
                                        minHeight: 30,
                                        maxWidth: 30,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ))),
            );
          })
        ],
      ),
      bottomSheet: BottomAppBar(
        color: Colors.blue[300],
        child: Container(
          width: double.infinity,
          child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.check_outlined),
              label: Text('Place order')),
        ),
      ),
    );
  }
}
