import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView.builder with Provider',
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
                title: Text(item.name),
                subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
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
    Item(name: 'Item 1', price: 10),
    Item(name: 'Item 2', price: 20),
    Item(name: 'Item 3', price: 30),
  ];
}

class Item {
  final String name;
  final double price;

  // Item({required this.name, required this.price});
}
