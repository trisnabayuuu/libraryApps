import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

class _HomeState extends State<Home> {

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text('Library Apps'),
        backgroundColor: Colors.black12,
        centerTitle: true,

      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 76.0,
        items: [
          CurvedNavigationBarItem(
              icon: Icon(Icons.home_filled, size: 30), label: "Home"),
          CurvedNavigationBarItem(
              icon: Icon(Icons.list, size: 30), label: "List"),
          CurvedNavigationBarItem(
              icon: Icon(Icons.perm_identity, size: 30), label: "User"),
        ],
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    //   body: Container(color: Colors.blueAccent),
    // )


      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                  final CurvedNavigationBarState? navBarState =
                  _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}

