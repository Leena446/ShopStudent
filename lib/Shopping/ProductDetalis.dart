import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'CartScreenPro.dart';
import 'Products.dart';
import 'badge.dart';
import 'cartt.dart';

class ProudctDetails extends StatefulWidget {
  static const String id = 'ProudctDetails';

  @override
  _ProudctDetailsState createState() => _ProudctDetailsState();
}

class _ProudctDetailsState extends State<ProudctDetails> {
  YoutubePlayerController _controller;

  String videoURL = 'https://www.youtube.com/watch?v=SQIbeAk-bFA';
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,

        ));
    getItemsFromFB();
    super.initState();
  }
  QuerySnapshot items;
  var _showFavoriteOnly = false;

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Add Product').get().then((value) {
      setState(() {
        items = value;
      });
    });
    print(items.docs.length.toString());
  }
  @override
  Widget build(BuildContext context) {
   final productId =
   ModalRoute.of(context).settings.arguments as String;
  final lodedProduct =  Provider.of<Products>(context,
  listen: false,
  ).findById(productId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(lodedProduct.title),
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
        ),
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("iPhones").snapshots(),
    builder:(context,snapshot){
    return ListView.builder(
    //itemCount: snapshot.data.docs.length,
        itemCount: 1,
        itemBuilder: (context,index){
    DocumentSnapshot iPhone = snapshot.data.docs[1];
    return SingleChildScrollView(
        child:Column(
        children:<Widget> [
          Container(
            height: 400,
            width: double.infinity,
            child: Carousel(
              images: [
                Image.network(iPhone["Store"],
                  fit: BoxFit.cover,),
                Image.network(iPhone["Store"],
                  fit: BoxFit.cover,),
                Image.network(iPhone["Store"],
                  fit: BoxFit.cover,),
                Image.network(iPhone["Store"],
                  fit: BoxFit.cover,),
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
              overlayShadowColors: Colors.teal,
              overlayShadowSize:20,
              autoplay: false,
            ),
          ),
          SizedBox(height: 10,),
          Text(lodedProduct.title,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 20),),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:1),
            width: double.infinity,
            child: Text(
              iPhone["price"] , style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:1),
            width: double.infinity,
            child: Text(
              iPhone["price"] , style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:1),
            width: double.infinity,
            child: Text(
              iPhone["price"] , style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:1),
            width: double.infinity,
            child: Text(
              iPhone["price"] , style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 200,
            width: 200,
            child: Image.network(lodedProduct.storeApp, height: 10,width: 10,
              fit: BoxFit.cover,),
          ),
          SizedBox(height: 10,),

        ],),);
    });
    }
      )
    );
  }
}
