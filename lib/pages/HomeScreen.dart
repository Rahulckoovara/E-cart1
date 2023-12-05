import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/model/my_product.dart';
import 'package:e_cart1/pages/cart1.dart';
import 'package:e_cart1/pages/details.dart';
import 'package:e_cart1/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {

  
  int isSelected = 0;
  TextEditingController searchController = TextEditingController();
  List<Product> filteredProducts = [];
  @override
  void initState() {
    super.initState();
    // Initialize the filteredProducts with all products initially
    filteredProducts = MyProducts.allProducts;
  }
  


  @override 

  
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Container(),
          title: Text(
            'E-Kart',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart1()));
                })
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller:  searchController,
                   onChanged: (query) {
              // Filter products based on the search query
                setState(() {
                filteredProducts = MyProducts.allProducts
                    .where((product) =>
                        product.name.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              });
            },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ))


          ),
     body: Column(
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
             )
             ),
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
                 ? _buildAllProducts(filteredProducts)
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

 _buildAllProducts(List<Product> products) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: (100 / 140)),
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Details(product: product)),
            ),
            child: ProductCart(product: product),
          );
        },
      );


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
