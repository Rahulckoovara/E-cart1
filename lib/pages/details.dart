import 'package:e_cart1/model/Product.dart';
import 'package:e_cart1/pages/availablesize.dart';
import 'package:e_cart1/pages/cart.dart';
import 'package:flutter/material.dart';
// import '../providers/cart_provider.dart';

class Details extends StatefulWidget {
  //final String size;
  final Product product;
  const Details({super.key, required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

   late String selectedSize;
   

  @override
  void initState() {
    super.initState();
    selectedSize = ' '; // Set an initial size, or you can leave it empty if you want no initial selection.
  }
  @override
  Widget build(BuildContext context) {
     
   // final provider = CartProvider.of(context);
    //final finalList = provider.cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 380,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: Color.fromARGB(255, 214, 220, 224)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            widget.product.image,
                            fit: BoxFit.contain,
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.all(7),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 241, 241),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name.toUpperCase(),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'Sans-serif', 
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '₹' '${widget.product.price.toString()}',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold,color: Colors.green),
                              ),
                              SizedBox(height: 20),
                              Text(widget.product.description),



                       SizedBox(
                          height: 30,
                        ),
                        Text('Available size',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                            ),
                           
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Availablesize(
                                 size: 'US 6',
                            isSelected: selectedSize == 'US 6',
                            onSizeSelected: () {
                              setState(() {
                                selectedSize = 'US 6';
                              });
                              },
                            ),
                            Availablesize(
                            size: 'US 7',
                            isSelected: selectedSize == 'US 7',
                            onSizeSelected: () {
                              setState(() {
                                selectedSize = 'US 7';
                              });
                            },
                          ),
                          Availablesize(
                            size: 'US 8',
                            isSelected: selectedSize == 'US 8',
                            onSizeSelected: () {
                              setState(() {
                                selectedSize = 'US 8';
                              });
                            },
                          ),
                          Availablesize(
                            size: 'US 9',
                            isSelected: selectedSize == 'US 9',
                            onSizeSelected: () {
                              setState(() {
                                selectedSize = 'US 9';
                              });
                            },
                          ),
                          
                              
                            ],
                            
                            
                            
                          ),
                        ),
                       
                          
                            ],
                          ),
                        )
                        
                      ],
                    ),
                  ))
            ]),
      ),



//--##############################--bottom bar--################################


  bottomSheet: Container(
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
          '₹' ' ${widget.product.price}',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return Cart();
              }));
              //   provider.toggleProduct(product);
            },
            icon: Icon(Icons.send),
            label: Text('Add To Cart'))
      ],
    ),
  
  
  
  ),





      
    );
  
    
  }
}
