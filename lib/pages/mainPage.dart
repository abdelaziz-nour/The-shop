import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mystore/main.dart';
import 'package:mystore/pages/cart.dart';
import 'package:mystore/pages/products.dart';

class MainPage extends StatefulWidget {
  String email;

  MainPage(this.email);
  @override
  State<MainPage> createState() => _MainPageState(email);
}

class _MainPageState extends State<MainPage> {
  String email;

  _MainPageState(this.email);
  @override
  Widget build(BuildContext context) {
    Map makeup = {
      0: {
        'image': 'images/cr1.jpeg',
        'title': 'Loos powder',
        'price': 30,
      },
      1: {
        'image': 'images/cr2.jpeg',
        'title': 'Contor',
        'price': 42,
      },
      2: {
        'image': 'images/cr3.jpeg',
        'title': 'Foundation',
        'price': 20,
      },
    };

    Map clothes = {
      0: {
        'image': 'images/lb1.jpeg',
        'title': 'Dress',
        'price': 15,
      },
      1: {
        'image': 'images/lb2.jpeg',
        'title': 'Abaya',
        'price': 20,
      },
      2: {
        'image': 'images/lb3.jpeg',
        'title': 'Formal Suit',
        'price': 25,
      },
    };

    Map perfumes = {
      0: {
        'image': 'images/per1.jpeg',
        'title': 'Ross',
        'price': 40,
      },
      1: {
        'image': 'images/per2.jpeg',
        'title': 'Versace',
        'price': 75,
      },
      2: {
        'image': 'images/per3.jpeg',
        'title': 'Joop',
        'price': 32,
      },
      3: {
        'image': 'images/per4.jpeg',
        'title': 'Dior',
        'price': 25,
      },
    };

    Map allproducts = {
      0: {
        'image': 'images/cr1.jpeg',
        'title': 'Loos powder',
        'price': 30,
      },
      1: {
        'image': 'images/cr2.jpeg',
        'title': 'Contor',
        'price': 42,
      },
      2: {
        'image': 'images/cr3.jpeg',
        'title': 'Foundation',
        'price': 20,
      },
      3: {
        'image': 'images/lb1.jpeg',
        'title': 'Dress',
        'price': 15,
      },
      4: {
        'image': 'images/lb2.jpeg',
        'title': 'Abaya',
        'price': 20,
      },
      5: {
        'image': 'images/lb3.jpeg',
        'title': 'Formal Suit',
        'price': 25,
      },
      6: {
        'image': 'images/per1.jpeg',
        'title': 'Ross',
        'price': 40,
      },
      7: {
        'image': 'images/per2.jpeg',
        'title': 'Versace',
        'price': 75,
      },
      8: {
        'image': 'images/per3.jpeg',
        'title': 'Joop',
        'price': 32,
      },
      9: {
        'image': 'images/per4.jpeg',
        'title': 'Dior',
        'price': 25,
      },
    
    };

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          )),
        ),
        title: Center(
          child: Container(
            margin: EdgeInsets.only(right: 50),
            child: Text(
              'Main Page',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.purple,
          ],
        )),
        child: ListView(
          primary: false,
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Products(makeup)),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      child: Image.asset('images/crColl.jpeg')),
                                  Text('Makeup',
                                      style: TextStyle(
                                          color: Colors.purple, fontSize: 25))
                                ],
                              )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Products(clothes)),
                        );
                      },
                      child: SizedBox(
                        width: 160,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white70, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      child: Image.asset('images/lbColl.jpeg'),
                                    ),
                                    Text('Clothes ',
                                        style: TextStyle(
                                            color: Colors.purple, fontSize: 25))
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Products(perfumes)),
                        );
                      },
                      child: SizedBox(
                        width: 160,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white70, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      child: Image.asset('images/perColl.jpeg'),
                                    ),
                                    Text('Perfumes ',
                                        style: TextStyle(
                                            color: Colors.purple, fontSize: 25))
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Products(allproducts)),
                        );
                      },
                      child: SizedBox(
                        width: 160,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    child: Image.asset('images/main.jpeg'),
                                  ),
                                  Text('All Products',
                                      style: TextStyle(
                                          color: Colors.purple, fontSize: 25))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.purple,
                  ],
                )),
                child: Center(
                    child: Text(
                  email,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
            ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.purple,
              ),
              title: const Text(
                'Cart',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            ListTile(
                title: const Text('Logout ', style: TextStyle(fontSize: 25)),
                leading: Icon(
                  Icons.account_box,
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                })
          ],
        ),
      ),
    );
  }
}
