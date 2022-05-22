import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../modles/itemsmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var database = FirebaseFirestore.instance.collection('cart').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => ItemModel.fromMap(doc.data())).toList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))),
      body: Container(
        decoration: const BoxDecoration(
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
            Center(
              child: Text(
                ' Cart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            StreamBuilder<List<ItemModel>>(
                stream: database,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: snapshot.data!.map(builditem).toList());
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget builditem(ItemModel item) => Card(
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
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image.asset(
                item.image,
                width: 100,
              ),
              title: Text(item.name),
              subtitle: Text('Price : ${item.price.toString()} \$'),
              trailing: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text('Delete'),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("cart")
                        .doc(item.name)
                        .delete();
                  }),
            ),
          ),
        ),
      );
}
