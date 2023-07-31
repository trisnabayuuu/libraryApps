
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BooksDetail extends StatelessWidget {
  const BooksDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deskripsi Buku'),
        backgroundColor: Colors.blue,
        leading: const BackButton(
          color: Colors.black,
        ),


      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Center(

              child: Image.asset(
                'images/filos.png',

                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              'Poor dad and Rich dad',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "30",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w100
              ),
            ),
            const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lorem turpis, tempor at ipsum non, rhoncus viverra risus. In hac habitasse platea dictumst. Phasellus et mattis orci. Maecenas bibendum lorem eget hendrerit auctor. Vivamus molestie congue lacinia. Maecenas condimentum tellus ex. Phasellus euismod mattis ligula at porta. Sed ut rhoncus est. Aliquam et convallis purus. Quisque ligula urna, feugiat vel sollicitudin vitae, rhoncus ac metus. Curabitur dolor tortor, ultricies sed lacus et, elementum blandit sapien. Praesent consectetur a enim sed faucibus. Cras rhoncus mollis tempor. Duis varius, dolor sed scelerisque feugiat, urna quam consequat ipsum, a placerat velit sem at purus. Nunc pulvinar at sapien et pulvinar. Nam id accumsan mauris. Cras ullamcorper aliquet velit, non tincidunt libero dapibus vitae. Integer euismod eleifend augue, in iaculis justo luctus ut. Integer vitae ex a magna vulputate iaculis sed eget dolor. Cras placerat metus justo, quis bibendum quam elementum lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur sed nibh urna. Aliquam erat volutpat. Proin ultrices augue non rutrum tempus. Aliquam ultricies mi eget fermentum maximus. Nulla sed diam ultricies, sodales lorem ac, porta mi. Phasellus mollis, purus quis porttitor posuere, elit velit blandit risus, in tincidunt ante ligula vitae ligula. Nam vel porttitor orci. Praesent quis feugiat sapien. Donec nec tortor accumsan, rhoncus lorem vel, mattis odio. Suspendisse eget sem tellus. Suspendisse aliquet est in rhoncus pulvinar. Integer vehicula justo in condimentum pharetra. Nullam a commodo elit. Cras vestibulum augue et est tempus semper. Mauris scelerisque metus eget condimentum interdum. Suspendisse tempor, enim ut ultrices feugiat, nisl mi congue justo, vitae volutpat massa nibh vulputate eros. Morbi malesuada vehicula urna non accumsan.",
            textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,

                fontWeight: FontWeight.normal,
              ),
            )
          )],

          ),
      ),


    );
  }
}
