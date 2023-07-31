import 'package:flutter/material.dart';

class createBook extends StatefulWidget {
  const createBook({Key? key}) : super(key: key);

  @override
  State<createBook> createState() => _createBookState();
}

class _createBookState extends State<createBook> {
  var judulController = TextEditingController();
  var deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membuat Buku'),
        backgroundColor: Colors.blue,
        leading: const BackButton(
          color: Colors.black,
        ),


      ),
    );
  }
}
