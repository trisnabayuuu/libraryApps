import 'dart:html';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libarary_apps_dart/create.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'books.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Library Apps",
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x66d8b9ff),
                      Color(0x99d8b9ff),
                      Color(0xccd8b9ff),
                      Color(0xffd8b9ff),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Login ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 50,),
                      loginBtn(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
class ListBook extends StatelessWidget {
  const ListBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Buku'),
        backgroundColor: Colors.blue,
      ),

      body: Consumer<BookProvider>(
        builder: (context, bookProvider, _) => ListView.builder(
          itemCount: bookProvider.books.length,
          itemBuilder: (context, index) {
            final book = bookProvider.books[index];
            return ListTile(
              title: Text(book.judul,),
              subtitle: Text( book.author),
              // leading: SizedBox(
              //   height: 100.0,
              //   width: 100.0, // fixed width and height
              //   child: Image.asset(book.image),
              //   ),



              onTap: () {
                // print(book.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BooksDetail(
                  )),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const createBook()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget loginBtn(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        final bookProvider = Provider.of<BookProvider>(context, listen: false);
        bookProvider.getBooks().then((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ListBook()),
          );
        });
      },
      child: const Text(
        "Login",
        style: TextStyle(
          color: Color(0xffd8b9ff),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class BookProvider extends ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => _books;

  Future<void> getBooks() async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response = await http.get(Uri.parse('http://localhost:1337/api/libraries'), headers: headers);
      var dataJson = jsonDecode(response.body);

      _books = List<Book>.from(dataJson["data"].map((bookData) => Book.fromJson(bookData["attributes"])));
      notifyListeners();

    } catch (error) {
      throw Exception('Failed to fetch books');
    }
  }
}

class Book {
  final String judul;
  final String author;
  // final String id;
  // Add more properties if necessary.

  Book({required this.judul, required this.author });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      judul: json["Judul"],
      author: json["Author"]
    );
  }
}
