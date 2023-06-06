
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libarary_apps_dart/gridView.dart';
import 'package:provider/provider.dart';

import 'books.dart';



void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ItemProvider()),
    ],
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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



Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        "Email",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(
                color: Colors.black,
                blurRadius: 6,
                offset: Offset(0,2)
            )]
        ),
        height: 60,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xffd8b9ff),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                  color: Colors.black38
              )
          ),
        ),
      )
    ],
  );
}

Widget buildpassword(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        "Password",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(
                color: Colors.black,
                blurRadius: 6,
                offset: Offset(0,2)
            )]
        ),
        height: 60,
        child: const TextField(
          obscureText: true,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xffd8b9ff),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                  color: Colors.black38
              )
          ),
        ),
      )
    ],
  );
}

Widget loginBtn(BuildContext context){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        backgroundColor: Colors.white,
      ),


      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ListBook()),
        );

      },
      child: const Text("Login",
      style: TextStyle(
        color: Color(0xffd8b9ff),
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),),

    ),
  );
}

class _HomeState extends State<Home> {

  // int _page = 0;
  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: const Color(0xccd8b9ff),
    //   appBar: AppBar(
    //     title: const Text('Library Apps'),
    //     backgroundColor: Colors.black12,
    //     centerTitle: true,
    //
    //   ),
    //   bottomNavigationBar: CurvedNavigationBar(
    //     key: _bottomNavigationKey,
    //     index: 0,
    //     height: 76.0,
    //     items: [
    //       CurvedNavigationBarItem(
    //           icon: const Icon(Icons.home_filled, size: 30), label: "Home"),
    //       CurvedNavigationBarItem(
    //           icon: const Icon(Icons.list, size: 30), label: "List"),
    //       CurvedNavigationBarItem(
    //           icon: const Icon(Icons.perm_identity, size: 30), label: "User"),
    //     ],
    //     backgroundColor: const Color(0xffd8b9ff),
    //     animationCurve: Curves.easeInOut,
    //     animationDuration: const Duration(milliseconds: 600),
    //     onTap: (index) {
    //       setState(() {
    //         _page = index;
    //       });
    //     },
    //     letIndexChange: (index) => true,
    //   ),
    // //   body: Container(color: Colors.blueAccent),
    // // )
    //
    //
    //   body: Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     decoration: const BoxDecoration(
    //         gradient: LinearGradient(
    //             begin: Alignment.topCenter,
    //             end: Alignment.bottomCenter,
    //             colors: [
    //               Color(0x66d8b9ff),
    //               Color(0x99d8b9ff),
    //               Color(0xccd8b9ff),
    //               Color(0xffd8b9ff),
    //             ]
    //         )
    //     ),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Text(_page.toString(), textScaleFactor: 10.0),
    //           ElevatedButton(
    //               child: const Text('Go To Page of index 1'),
    //               onPressed: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(builder: (context) => const homepage()),
    //               // final CurvedNavigationBarState? navBarState =
    //               // _bottomNavigationKey.currentState;
    //               // navBarState?.setPage(1);
    //                 );},
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
                        ]
                    )
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      const Text("Login ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 50,),
                      buildEmail(),
                      buildpassword(),
                      loginBtn(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class ListBook extends StatelessWidget {
  const ListBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Book List'),
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



