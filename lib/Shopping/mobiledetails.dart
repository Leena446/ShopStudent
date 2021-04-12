import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Product.dart';
import 'cartt.dart';

class MobileDetails extends StatefulWidget {
  static const String id = 'MobileDetails';

  _MobileDetailsState createState() => _MobileDetailsState();
}


class _MobileDetailsState extends State<MobileDetails>{
  String videoURL = 'https://www.youtube.com/watch?v=SQIbeAk-bFA';

  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,

        ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final product =  Provider.of<Product>(context,listen: false );
    final cart  = Provider.of<Cartt>(context,listen: false);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
         appBar: AppBar(
         title: Text("Details"),
           backgroundColor: Color(0xff03989E),
           actions: <Widget>[
             IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
           //   Navigator.pushNamed(context , CartSh.id);
             },
             ),
           ],
           centerTitle: true,
    ),
           body: ListView(
            children: <Widget>[
              Container(
                height: 300,
                child: GridTile(
                   child: Carousel(
                images: [
                  Image.network("https://media.extra.com/i/aurora/100203575_100_01?w=800&h=800&img404=missing_product&v=false"),
                  Image.network( "https://media.extra.com/i/aurora/100203575_100_02?w=800&h=800&img404=missing_product&v=false"),
                  Image.network(  "https://media.extra.com/i/aurora/100203575_100_03?w=800&h=800&img404=missing_product&v=false"),
                  Image.network(  "https://media.extra.com/i/aurora/100203575_100_04?w=800&h=800&img404=missing_product&v=false"),
                  Image.network(  "https://media.extra.com/i/aurora/100203575_100_05?w=800&h=800&img404=missing_product&v=false"),
                  YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: _controller),
                    onEnterFullScreen: () {
                      SystemChrome.setPreferredOrientations(DeviceOrientation.values);
                    },


                    builder: (context, player) {
                      return Column(
                        children: [ // some widgets
                          player, //some other widgets
                        ],);},),
                ],

                       showIndicator: true,
                       borderRadius: true,
                       moveIndicatorFromBottom: 180.0,
                       noRadiusForIndicator: true,
                       overlayShadow: true,
                       overlayShadowColors: Colors.white,
                       overlayShadowSize:20,
                        autoplay: false,



                   ),
                  footer: Container(
                    color: Colors.black,
                    alignment: Alignment.center, child: Text("iPhone"),
                  ),),),
              Container(padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text("iPhone 12 PRO ", style: TextStyle(fontSize: 20),),),
              Container( padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text("Specifications",style: TextStyle(fontSize: 30)),),
           Row(
             children:[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                         Text("128  ", style: TextStyle(fontSize: 20, color: Colors.black45),),
                         Text(" :Capacity ", style: TextStyle(fontSize: 20),),
                      ],),),
                      Container(
                        padding: EdgeInsets.all(10),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                          Text("	6.7 ", style: TextStyle(fontSize: 20,color: Colors.black45),),
                          Text(" :Display size ", style: TextStyle(fontSize: 20),),
                        ],),),
                      Container(
                        padding: EdgeInsets.all(10),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                          Text("iOS 14 ", style: TextStyle(fontSize: 20 , color: Colors.black45),),
                          Text(" :Operating system ", style: TextStyle(fontSize: 20),),
                        ],),),
                      Container(
                        padding: EdgeInsets.all(10),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("SIM 1: Nano;SIM 2: eSIM ", style: TextStyle(fontSize: 20,color: Colors.black45),),
                            Text(" :SIM type ", style: TextStyle(fontSize: 20),),
                          ],),),

                      Container(
                      child:  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      Image.network("https://upload.wikimedia.org/wikipedia/ar/thumb/7/7e/Extra_Logo.svg/1200px-Extra_Logo.svg.png",
                        height: 60,width: 370,),],),),
                    ],
                  ),
                ),
              )
            ], ),
        ],
           ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
            Expanded(
              child:  FloatingActionButton.extended(
                onPressed: (){
                  cart.addItem(product.idd, product.title, product.price);
                  Scaffold.of(context).hideCurrentSnackBar();
                 },
              label: Text('Buy Now'),
              icon: Icon(Icons.shopping_cart),
              backgroundColor: Colors.deepOrange[800],
          ),
            ),
                 FloatingActionButton(
                      child: Icon(
                          Icons.add

                      ),
                      backgroundColor: Colors.teal[400],
                      onPressed: () {
                  // Navigator.pushNamed(context, CartScreen.id);
                      },
                   heroTag: null,
                  ),
                 FloatingActionButton(
                      child: Icon(
                          Icons.favorite
                              , color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                      onPressed: () {
                        //        Navigator.pushNamed(context, Test3.id);
                      },
                   heroTag: null,
                    ),

                ], ),
    ),),);

  }
  }



