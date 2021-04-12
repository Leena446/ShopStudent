
import 'package:electro_mania_afnan/Shopping/CartScreenPro.dart';
import 'package:electro_mania_afnan/Shopping/badge.dart';
import 'package:electro_mania_afnan/Shopping/cartt.dart';
import 'package:electro_mania_afnan/drawer/FeedApp.dart';
import 'package:electro_mania_afnan/Shopping/mobiledetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class mobile extends StatefulWidget {
  static const String id = 'mobile';
  //  final String title;
  _mobileState createState() => _mobileState();
}
class _mobileState extends State<mobile> {

  @override
  var Mobilelist = [{
    "name": "Apple iPhone 12 Pro Max",
    "memory": "256GB",
    "price": "5699SR",
    "store":"https://upload.wikimedia.org/wikipedia/ar/thumb/7/7e/Extra_Logo.svg/1200px-Extra_Logo.svg.png"



  },
    {
      "name": "Iphone",
      "memory": "20G",
      "price": "2346",
      "store":"https://upload.wikimedia.org/wikipedia/ar/thumb/7/7e/Extra_Logo.svg/1200px-Extra_Logo.svg.png"


    },
    {
      "name": "Apple iPhone 12 Pro Max",
      "memory": "256GB",
      "price": "5699SR",
      "store":"https://upload.wikimedia.org/wikipedia/ar/thumb/7/7e/Extra_Logo.svg/1200px-Extra_Logo.svg.png"


    },
    {
      "name": "Apple iPhone 12 Pro Max",
      "memory": "256GB",
      "price": "5699SR",
      "store":"https://upload.wikimedia.org/wikipedia/ar/thumb/7/7e/Extra_Logo.svg/1200px-Extra_Logo.svg.png"

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Devices"),
          backgroundColor: Color(0xff03989E),
          actions: <Widget>[
            Consumer<Cartt>(
              builder: (_, cart,ch,)=> Badge(
                child: ch,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(
                    Icons.shopping_cart
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreenPro.id);
                },
              ),),
          ],
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: Mobilelist.length,
          itemBuilder: (context,i){
            return Moblist(price: Mobilelist[i]["price"] ,
              name: Mobilelist[i]["name"],
              memory: Mobilelist[i]["memory"],
              store: Mobilelist[i]["store"],);
          },

        ),

      ),

    );}
}


class Moblist extends StatelessWidget {
  final name;
  final price;
  final memory;
  final store;

  Moblist({Key key, this.name, this.price, this.memory, this.store})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 200,
        width: 100,
        child: Card(
          child: Row(
            children: <Widget>[


              Expanded(
                flex: 2,
                child: Container(
                  height: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin:
                        EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(name, style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,),
                            textAlign: TextAlign.center),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            memory,
                            style: TextStyle(color: Colors.teal),
                          ),
                          Text(
                            " :Memory",
                            style: TextStyle(color: Colors.black),
                          ),

                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:10 ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            price,
                            style: TextStyle(color: Colors.teal ,  fontSize: 15),
                          ),
                          Text(
                              " :Price",
                              style: TextStyle(color: Colors.black , fontSize: 15
                              ),textAlign: TextAlign.center
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                  size: 30,
                                ),
                                onPressed: (){
                                  Navigator.of(context).pushNamed(CartScreenPro.id);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                onPressed: (){
                                  Navigator.of(context).pushNamed(CartScreenPro.id);
                                },
                              ),
                            ],
                          ),
                          Image.network("https://upload.wikimedia.org/wikipedia/ar/thumb/7/7e/Extra_Logo.svg/1200px-Extra_Logo.svg.png",
                            height: 70,width: 80,),


                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.network(
                    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&amp;hei=1112&amp;fmt=jpeg&amp;qlt=80&amp;op_usm=0.5,0.5&amp;.v=1604021663000"),
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        Navigator.pushNamed(context, MobileDetails.id);
      },
    );



  }
}
