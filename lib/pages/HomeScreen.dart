import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/model/my_product.dart';
import 'package:e_cart1/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:e_cart1/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        children: [
          CarouselSlider(
              items: [
                Image.asset('assets/ad/ad1.png'),
                Image.asset('assets/ad/ad2.png'),
              ],
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                viewportFraction: 1,
              )),
          // const Text(
          //   'Products',
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductCategory(index: 0, name: 'All Products'),
                _buildProductCategory(index: 1, name: 'Jackets'),
                _buildProductCategory(index: 2, name: 'Shoes'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: isSelected == 0
                  ? _buildAllProducts()
                  : isSelected == 1
                      ? _builsJackets()
                      : _buildShoes())
        ],
      ),
    );
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() {
          isSelected = index;
        }),
        child: Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.blue : Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  _buildAllProducts() => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: (100 / 140)),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.allProducts.length,
      itemBuilder: (context, index) {
        final allProducts = MyProducts.allProducts[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(product: allProducts))),
            child: ProductCart(product: allProducts));
      });

  _builsJackets() => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: (100 / 140)),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.Jackets.length,
      itemBuilder: (context, index) {
        final Jackets = MyProducts.Jackets[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(product: Jackets))),
            child: ProductCart(product: Jackets));
      });

  _buildShoes() => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: (100 / 140)),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.shoes.length,
      itemBuilder: (context, index) {
        final shoes = MyProducts.shoes[index];
        return GestureDetector(
            onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(product: shoes))),
                },
            child: ProductCart(product: shoes));
      });
}
