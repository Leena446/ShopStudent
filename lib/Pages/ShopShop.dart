import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'CartCart.dart';
enum FilterOption {
  favorites,
  All,
}
class ShopShop extends StatefulWidget {
  @override
  _ShopShopState createState() => _ShopShopState();
  ShopShop({this.DevicesId,});// Here we create an instance of this class as a parameter
  final String DevicesId;

}
class _ShopShopState extends State<ShopShop> {
  QuerySnapshot items;
  QuerySnapshot itemsInCart;
  var _showFavoriteOnly = false;

  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('DevicesDetails')
        .where('DevicesId',isEqualTo: widget.DevicesId)// Here is a condition to get only items with this MajorID.
    // (widget) means the access of the main class parameter.
        .get().then((value) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.favorites) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Only favorite"),
                value: FilterOption.favorites,
              ),
              PopupMenuItem(
                child: Text("Show all"),
                value: FilterOption.All,
              )
            ],
          ),
          // Consumer<Cartt>(
          //   builder: (
          //       _,
          //       cart,
          //       ch,
          //       ) =>
          //       Badge(
          //         child: ch,
          //         value: cartBadgQTY.toString(),
          //         color: Colors.black54,
          //       ),
          //   child:
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CartCart(
                        // ModelId: widget.ModelId,
                        // routeName: 'ShopShop'
                    )));
              },
            ),
        //  ),

        ],
      ),
      body: GestureDetector(

        onTap: (){

        },
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
    if(items==null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return ListView.builder(
        itemCount: items.docs.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              // onTap: (){
              //   Navigator.push(context ,
              //       MaterialPageRoute(builder:(context) => ProDetalis(
              //         imag: items.docs[i].data()['imageUrl'],
              //         //  Capicty: items.docs[i].data()['Capicty'],
              //         price: items.docs[i].data()['price'],
              //         store: items.docs[i].data()['store'],
              //         description: items.docs[i].data()['description'],
              //         model: items.docs[i].data()['model'],
              //         other: items.docs[i].data()['other'],
              //
              //
              //       )));
              // },
              child: Card(
                  color: Colors.white,
                  elevation: 10,
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
                                      image: NetworkImage(items.docs[i].data()['imageUrl'])
                                  )
                              ),
                            ),
                            Text(
                              items.docs[i].data()['DeviceBrand'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        items.docs[i].data()['Price'].toString()+' SR',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Store ',
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
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Capacity',
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
                                            fontWeight: FontWeight.bold
                                        ),
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
                          child:  IconButton(
                            icon: Icon(
                              //product.isFavorite ? Icons.favorite : Icons.favorite_border,
                                Icons.favorite_border
                            ),
                            color: Colors.red[600],
                            onPressed: () {
                              //product.toggleFavoriteStatus();
                            },
                          ),
                        ),
                        Positioned(
                          left: 345,
                          child:   Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                ),
                                onPressed: () {
                                  setState(() {
                            //        cartBadgQTY=cartBadgQTY+1;
                                    getItemsFromFB();
                                    itemsInCart.docs.length;
                                  });
                                  // creatdoc( items.docs[i].data()['Title'],
                                  //   items.docs[i].data()['Price'],
                                  //   items.docs[i].data()['Store'],
                                  //   items.docs[i].data()['Capicty'],);
                                  // Scaffold.of(context).hideCurrentSnackBar();
                                  //  Scaffold.of(context).openDrawer(); // حيفتح لما اضغط على الكارت صفحه الاوردر
                                  Scaffold.of(context).showSnackBar(SnackBar(
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
                  )
              ),
            ),
          );
        },
      );
    }
  }

  // creatdoc(t, b, store, Capicty) async {
  //   try {
  //     DocumentReference reference =
  //     FirebaseFirestore.instance.collection("Cart").doc();
  //     Map<String, dynamic> c = {
  //       'Title': t,
  //       'id': reference.id,
  //       'userid': FirebaseAuth.instance.currentUser.uid,
  //       'price': b,
  //       'state': "inCart",
  //       "email": FirebaseAuth.instance.currentUser.email,
  //       "time": DateFormat("dd/MM/yyy/hh:mm").format(DateTime.now()).toString(),
  //       "store": store,
  //       "Capicty": Capicty,
  //       "StateOrder": "waiting",
  //     };
  //     reference
  //         .set(c)
  //         .whenComplete(() => print("@@@@@${reference.id} is coplete"));
  //   } catch (e) {
  //     print('$e -- in method creatdoc');
  //   }
  // }
}