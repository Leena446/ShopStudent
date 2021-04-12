import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'CartCart.dart';
import 'ProDetalis.dart';


enum FilterOption {
  favorites,
  All,
}

class ShopHelp extends StatefulWidget {
  @override
  _ShopHelpState createState() => _ShopHelpState();
  ShopHelp({this.majorID}); // Here we create an instance of this class as a parameter
  final String majorID; // this is the first parameter assigned as final
}

class _ShopHelpState extends State<ShopHelp> {
  QuerySnapshot items;
  QuerySnapshot itemsInCart;
  var _showFavoriteOnly = false;

  @override
  void initState() {
    getItemsFromFB();
    // getItemsFromFB2;
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance
        .collection('DeviceMajor')
        .where('MajorType',
        isEqualTo: widget
            .majorID) // Here is a condition to get only items with this MajorID.
    // (widget) means the access of the main class parameter.
        .get()
        .then((value) {
      setState(() {
        items = value;
      });
    });
    print('Getting Items #FB2.....');
    await FirebaseFirestore.instance
        .collection('Cart')
        .where('state', isEqualTo: 'inCart')
        .get()
        .then((value2) {
      // print(value);
      // print(value.docs[0].data()["price"]);
      setState(() {
        itemsInCart = value2;
      });
    });
    print(itemsInCart.docs.length.toString());
    print(items.docs.length.toString());
  }

  // getItemsFromFB2() async {
  //   print('Getting Items #FB2.....');
  //   await FirebaseFirestore.instance
  //       .collection('Cart')
  //       .where('state', isEqualTo: 'inCart')
  //       .get()
  //       .then((value2) {
  //     // print(value);
  //     // print(value.docs[0].data()["price"]);
  //     setState(() {
  //       itemsInCart = value2;
  //     });
  //   });
  //   print(itemsInCart.docs.length.toString());
  // }

  String returnCartQty() {
    return itemsInCart.docs.length.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CartCart(
                        // majorID: widget.majorID,
                        // routeName: 'ShopHelp',
                      )));
            },
          ),
          //),
        ],
      ),
      body: GestureDetector(
        onTap: () {},
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: itemsFlowList(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemsFlowList(BuildContext context) {
    if (items == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: items.docs.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProDetalis(
                              imag: items.docs[i].data()['imageUrl'],
                              capicty: items.docs[i].data()['Capicty'],
                              price: items.docs[i].data()['Price'],
                              store: items.docs[i].data()['Store'],
                              description: items.docs[i].data()['Description'],
                              model: items.docs[i].data()['DeviceModel'],
                              other: items.docs[i].data()['Other'],
                              screen: items.docs[i].data()['Screen Display'],
                              ram: items.docs[i].data()['Ram'],
                            )));
              },
              child: Card(
                  color: Colors.white,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          items.docs[i].data()['imageUrl']))),
                            ),
                            Text(
                              items.docs[i].data()['DeviceModel'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Price',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        items.docs[i]
                                            .data()['Price']
                                            .toString() +
                                            ' SR',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'store ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        items.docs[i].data()['Store'],
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Capcity ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                  Text(
                                    items.docs[i].data()['Capicty'],
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          right: 345,
                          child: IconButton(
                            icon: Icon(
                              //product.isFavorite ? Icons.favorite : Icons.favorite_border,
                                Icons.favorite_border),
                            color: Colors.red[600],
                            onPressed: () {
                              wishList(
                                items.docs[i].data()['DeviceModel'],
                                items.docs[i].data()['Price'],
                                items.docs[i].data()['Store'],
                                items.docs[i].data()['imageUrl'],
                                //items.docs[i].data()['Capicty'],
                              );
                            Scaffold.of(context).hideCurrentSnackBar();
                            //  Scaffold.of(context).openDrawer(); // حيفتح لما اضغط على الكارت صفحه الاوردر
                            Scaffold.of(context).showSnackBar(
                            SnackBar(
                            content: Text(
                            'Added item to WishList!',
                              style: TextStyle(fontSize: 20),
                            ),
                            duration: Duration(seconds: 2),
                            ),
                            );
                            },
                          ),
                        ),
                        Positioned(
                          left: 345,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                ),
                                onPressed: () {
                                  setState(() {
                                    cartBadgQTY = cartBadgQTY + 1;
                                    getItemsFromFB();
                                    itemsInCart.docs.length;
                                  });
                                  creatdoc(
                                    items.docs[i].data()['DeviceModel'],
                                    items.docs[i].data()['Price'],
                                    items.docs[i].data()['Store'],
                                  );
                                  Scaffold.of(context).hideCurrentSnackBar();
                                  //  Scaffold.of(context).openDrawer(); // حيفتح لما اضغط على الكارت صفحه الاوردر
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Added item to cart!',
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                color: Colors.teal,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      );
    }
  }

  wishList(model, b, store,img) async {
    try {
      DocumentReference reference = FirebaseFirestore.instance.collection("WishListUser").doc();
      Map<String, dynamic> c = {
        'model': model,
        'id': reference.id,
        'userid': FirebaseAuth.instance.currentUser.uid,
        'price': b,
        "email": FirebaseAuth.instance.currentUser.email,
        "store": store,
        //  "Capicty": Capicty,
        // "StateOrder": "waiting",
        "wishList":"inListWish",
        "img": img,
      };
      reference
          .set(c)
          .whenComplete(() => print("@@@@@${reference.id} is wishList"));
    } catch (e) {
      print('$e -- in method wishList');
    }
  }

  creatdoc(model,b, store) async {
    DocumentReference reference =
    FirebaseFirestore.instance.collection("Cart").doc();
    final userId = FirebaseAuth.instance.currentUser.uid;
    //final OrderId =  '${userId}' ;

    try {

      Map<String, dynamic> c = {
        'model': model,
        'id': reference.id,
        'userid': FirebaseAuth.instance.currentUser.uid,
        'price': b,
        'state': "inCart",
        "email": FirebaseAuth.instance.currentUser.email,
        "time": DateFormat("dd/MM/yyy/hh:mm").format(DateTime.now()).toString(),
        "store": store,
      //  "Capicty": Capicty,
        "StateOrder": "waiting",
      };
      reference
          .set(c)
          .whenComplete(() => print("@@@@@${reference.id} is coplete"));
    } catch (e) {
      print('$e -- in method creatdoc');
    }
  }
}