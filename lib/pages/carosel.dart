import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class slider1 extends StatelessWidget {
  const slider1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      
        children:[
      
              
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
        ]
        
       
      
      ),
    );
  }
}