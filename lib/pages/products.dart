import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../modles/itemsmodel.dart';

class Products extends StatefulWidget {
  Map map;

  Products(this.map);

  @override
  State<Products> createState() => _ProductsState(map);
}

class _ProductsState extends State<Products> {
  Map map;

  _ProductsState(this.map);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: (Icon(Icons.arrow_back)),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Card(
                    child: Card(
                      child: Center(
                        child: Text(
                          'All Procucts',
                          style: TextStyle(color: Colors.purple, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: map == null ? 0 : map.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Card(
                        child: Card(
                          child: Card(
                            child: ListTile(
                              title: Text(
                                map[index]['title'],
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                  'Price : ${map[index]['price']} \$',
                                  style: TextStyle(fontSize: 15)),
                              leading: SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                child: Image.asset(map[index]['image']),
                              ),
                              trailing: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.purple),
                                  ),
                                  child: Icon(
                                      Icons.production_quantity_limits_sharp),
                                  onPressed: () async {
                                    var database = FirebaseFirestore.instance;
                                    var ITEMMODEL = ItemModel(
                                        name: map[index]['title'],
                                        price: map[index]['price'],
                                        image: map[index]['image']);
                                    ITEMMODEL.name = map[index]['title'];
                                    ITEMMODEL.price = map[index]['price'];
                                    ITEMMODEL.image = map[index]['image'];
                                    await database
                                        .collection('cart')
                                        .doc(map[index]['title'])
                                        .set(ITEMMODEL.toMap());
                                    _scaffoldKey.currentState!.showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                map[index]['title'] +
                                                    ' added to cart',
                                                style:
                                                    TextStyle(fontSize: 20))));
                                  }),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
