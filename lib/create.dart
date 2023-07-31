import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class createBook extends StatefulWidget {
  const createBook({Key? key}) : super(key: key);

  @override
  State<createBook> createState() => _createBookState();
}

class _createBookState extends State<createBook> {
  var judulController = TextEditingController();
  var deskripsiController = TextEditingController();
  var authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("tambah buku"),
            backgroundColor: Color(0xffd8b9ff),
    ),

        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
            TextField(
              controller: judulController,
              decoration: InputDecoration(hintText: "Judul"),
          ),
            TextField(
              controller: deskripsiController,
              decoration: InputDecoration(hintText: "deskripsi"),
          ),
              TextField(
                controller: authorController,
                decoration: InputDecoration(hintText: "author"),
              ),
            SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () async {
                Map<String, String> headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                };
                var response = await http.post(
                    Uri.parse('http://localhost:1337/api/libraries'),
                    headers: headers,
                    body: jsonEncode({
                      "data": {
                        "Judul": judulController.text,
                        "Deskripsi": deskripsiController.text,
                        "Author": authorController.text,
                      }
                    }));
                },
                child: Text("Simpan"))
            ],
          ),
    ),
    );
  }
}
