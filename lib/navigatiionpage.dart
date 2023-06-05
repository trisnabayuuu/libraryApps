import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class navigation extends StatefulWidget {
  const navigation({Key? key}) : super(key: key);

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {


  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xccd8b9ff),
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
              icon: const Icon(Icons.home_filled, size: 30), label: "Home"),
          CurvedNavigationBarItem(
              icon: const Icon(Icons.list, size: 30), label: "List"),
          CurvedNavigationBarItem(
              icon: const Icon(Icons.perm_identity, size: 30), label: "User"),
        ],
        backgroundColor: const Color(0xffd8b9ff),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              ElevatedButton(
                child: const Text('Go To Page of index 1'),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const homepage()),
                  //   // final CurvedNavigationBarState? navBarState =
                  //   // _bottomNavigationKey.currentState;
                  //   // navBarState?.setPage(1);
                  // );
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
