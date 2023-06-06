
import 'package:flutter/material.dart';
import 'package:libarary_apps_dart/books.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
      ],
      child: ListBook(),
    ),
  );
}
class ListBook extends StatelessWidget {
  const ListBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView.builder with Provider'),
        ),
        body: Consumer<ItemProvider>(
          builder: (context, itemProvider, _) => ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return ListTile(
                leading: SizedBox(
                  height: 100.0,
                  width: 100.0, // fixed width and height
                  child: Image.asset(item.image),
                )
                ,title: Text(item.name),
                subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BooksDetail()),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemProvider extends ChangeNotifier {
  List<Item> items = [

    Item(
      image: "images/poordad.jpeg",
      name: 'Rich dad and poor Dad',
      price: 10,
      desc: "asd",
    ),
    Item(
      image: "images/bicaraadaseninya.jpeg",
      name: 'Bicara Seadanya',
      price: 20,
      desc: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    ),
    Item(
      image: "images/sebuahsenibodoamat.png",
      name: 'Sebuah Seni Bodo Amat',
      price: 30,
      desc: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    ),
    Item(
      image: "images/filos.png",
      name: 'Item 4',
      price: 10,
      desc: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    ),
    Item(
      image: "images/bicaraadaseninya.jpeg",
      name: 'Item 2',
      price: 20,
      desc: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    ),
    Item(
      image: "images/sebuahsenibodoamat.png",
      name: 'Item 3',
      price: 30,
      desc: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    ),
  ];

// static get desc => null;
}

class Item {
  final String image;
  final String name;
  final double price;
  final String desc;

  Item({required this.image, required this.name, required this.price, required this.desc});

}



