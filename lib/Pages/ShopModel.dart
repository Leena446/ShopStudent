import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Shopping/cartt.dart';

enum FilterOption {
  favorites,
  All,
}

class ShopModel extends StatefulWidget {
  @override
  _ShopModelState createState() => _ShopModelState();
  ShopModel({this.type, this.market, this.model, this.colorCapacity});// Here we create an instance of this class as a parameter
  final String market;
  final String model;
  final String colorCapacity;
  final String type;// this is the first parameter assigned as final
}

class _ShopModelState extends State<ShopModel> {
  QuerySnapshot items;
  var _showFavoriteOnly = false;

  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    print(widget.type);
    print(widget.market);
    print(widget.colorCapacity);
    print(widget.model);
    await FirebaseFirestore.instance.collection('devices')
        .where('type',isEqualTo: widget.type) // Here is a condition to get only items with this MajorID.
        .where('market',isEqualTo: widget.market)
        .where('color.capacity', isEqualTo: widget.colorCapacity)
        .where('model', isEqualTo: widget.model)
    // (widget) means the access of the main class parameter.
        .get().then((value) {
      setState(() {
        items = value;
      });
    });
    //print(items.docs.length.toString());
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
          //         value: cart.itemCount.toString(),
          //       ),
          //   child: IconButton(
          //     icon: Icon(Icons.shopping_cart),
          //     onPressed: () {
          //     },
          //   ),
          // ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: itemsFlowList(context),
            )
          ],
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
              //         imag:items.docs[i].data()['imageUrl']
              //         ,Capicty:items.docs[i].data()['color.capacity'] ,
              //         Price:items.docs[i].data()['price'].toString(),
              //         store:  items.docs[i].data()['store'],
              //         Descrption: items.docs[i].data()['description'],
              //         Title: items.docs[i].data()['model'],
              //         Other:  items.docs[i].data()['other'],
              //
              //
              //       )));
              // },
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
                                      image: NetworkImage(items.docs[i].data()['imageUrl'])
                                  )
                              ),
                            ),
                            Text(
                              items.docs[i].data()['model'],
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
                                        'price',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        items.docs[i].data()['price'].toString()+' SR',
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
                                        'store',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        items.docs[i].data()['store'],
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
                                        'colorCapacity',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        items.docs[i].data()['color.capacity'],
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
                                  // creatdoc( items.docs[i].data()['model'],  items.docs[i].data()['price'].toString()+' SR',);
                                  // Scaffold.of(context).hideCurrentSnackBar();
                                  //  Scaffold.of(context).openDrawer(); // حيفتح لما اضغط على الكارت صفحه الاوردر
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      'Added item to cart!',
                                    ),
                                    duration: Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        Cartt().removeSingleItem(items.docs[i].id);
                                      },
                                    ),
                                  ));
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
//
// creatdoc(t,b) async {
//   try {
//     DocumentReference reference= FirebaseFirestore.instance.collection("Cart").doc();
//     Map<String, dynamic> c = {
//       'Title': t,
//       'id':reference.id,
//       'userid': FirebaseAuth.instance.currentUser.uid,
//       'price': b,
//       'email': FirebaseAuth.instance.currentUser.email,};
//     reference.set(c).whenComplete(() =>
//         print("@@@@@${reference.id} is coplete"));
//   }
//
//   catch(e){print('$e ---------- in method creatdoc');}
// }

}