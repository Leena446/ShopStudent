import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product with ChangeNotifier{
  static const IDD ="idd";
  static const TITLE="title";
  static const CONSTORICE ="constprice";
  static const DESCRIPTION ="description";
  static const IMAGEURL ="imageUrl";
  static const IMAGEURL2 ="imageUrl2";
  static const IMAGEURL3 ="imageUrl3";
  static const IMAGEURL4 ="imageUrl4";
  static const STOREAPP ="storeApp";
  static const  CAPICTY ="capicty";
  static const OPERTINGSYSTEM ="OperatingSystem";
  static const NETWORK ="Network";
  static const OTHER ="other";
  static const  WAARRANTY ="Warranty";
  static const  VIDEOURL ="videoURL";

   String idd;
   String title;
   double price;
  int count;
  String description;
   String imageUrl;
   String imageUrl2;
   String imageUrl3;
   String imageUrl4;
   String storeApp;
   String capicty;
   String OperatingSystem;
   String network;
   String other;
   String warranty;
   String videoURL;
  bool isFavorite;
/*
String get Id => idd;
String get Title => title;
double get Price => price;
String get Description => description;
String get ImageURL => imageUrl;
String get ImageURL2 => imageUrl2;
String get ImageURL3 => imageUrl3;
String get ImageURL4 => imageUrl4;
  String get StoreApp => storeApp;
  String get Capicty => capicty;
  String get  OPeratingSystem => OperatingSystem;
  String get Network => network;
  String get  Other => other;
  String get Warranty => warranty;
  String get VideoURL => videoURL;
  bool get IsFavorite => isFavorite;

Product.fromSnapshot(DocumentSnapshot snapshot){
  Map data = snapshot.data;
  idd = data[Id];
  title = data[Title];



}


 */


  Product({
    @required this.title,
    @required  this.imageUrl,
    @required this.warranty,
    @required this.capicty,
    @required this.videoURL,
    @required this.OperatingSystem,
    @required this.network,
    @required this.other,
   @required this.storeApp,
    @required  this.price,
    @required  this.idd,
    @required  this.description,
    @required  this.imageUrl2,
    @required  this.imageUrl3,
    @required  this.imageUrl4,
    @required  this.count,
    this.isFavorite = false
  });


  void toggleFavoriteStatus(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
