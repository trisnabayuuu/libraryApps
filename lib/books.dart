
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BooksDetail extends StatefulWidget {
  // final String bookId;



  // const BooksDetail({required this.bookId, Key? key}) : super(key: key);
  const BooksDetail({ Key? key}) : super(key: key);
  @override
  State<BooksDetail> createState() => _BooksDetailState();
}

class _BooksDetailState extends State<BooksDetail> {
  late Future<Map<String, dynamic>> _bookDataFuture;

  @override
  void initState() {
    super.initState();
    // _bookDataFuture = _fetchBookData();
  }

  // Future<Map<String, dynamic>> _fetchBookData() async {
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //   };
  //   final response = await http.get(
  //     Uri.parse('http://localhost:1337/api/libraries/${widget.bookId}'),
  //     headers: headers,
  //   );
  //   jsonDecode(response.body)["data"]["attributes"];
  // }

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
            textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 18,

                fontWeight: FontWeight.normal,
              ),
              "ini text",
            )
          )],

          ),
      ),


    );
  }
}



